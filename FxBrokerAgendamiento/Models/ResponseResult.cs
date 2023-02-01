using Newtonsoft.Json;

using System;

namespace FxBrokerAgendamiento.Models
{
    public class ResponseResult
    {
        [JsonProperty("isError")]
        public bool IsError { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("timeStamp")]
        public DateTime Timestamp { get; set; } = DateTime.UtcNow;
    }
}