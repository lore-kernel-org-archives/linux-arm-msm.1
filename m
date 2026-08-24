Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD1B430CFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579746; cv=none; b=Bv9SJYRpCFUTZyQhuSTYk1RJwwi0Kg98XjLdQPcpuCy1pQ7Thinus03gxHoee6t2DgBbYHb6JhFSa9cZdoUdjdR+tj+xKMKraiRZh49VLZ51Yd1zukwnnfdT07mpTfBPNvZYsjFSEho2HIkcVftb/S5i9Qsz5kMO2kFNkoK36+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579746; c=relaxed/simple;
	bh=+qv+TfTQ75E9D5fgJmcO2yIFIeUhqe9JoXKjHwH7ycU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXeKRLypewgkn6x6l/DsmWUg40wanvebzaf+sX1I24T0F6yZotn7IffA/fpkPzR9awTq9YQ7XpkcMxaGiecW4FxoYYXKDqDlFc0be444Nc8EkvOtGH+tkbp/5yXhabQSLeCLPcBvhxXWcudZr5Q4Bj7X7QIHh4pGJtkpNzUlJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4HFcVB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwHXzKfK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4HFcVB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwHXzKfK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv5fP2006632
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=; b=O4HFcVB5Ki9Y0e2L
	zFUg+GbkeUJyHkdWRqQ4OYeFP5Bl3Dt4L0RPUf5Llck55to3FvwdI3ouBobTTRC5
	RAH7rK57OtdJVZvhME6Pgp3Ol9qUR+3yPO7l7ObErQz0zL8FsqiqM4eQfr6sr2v6
	P96rss27FQb2hY9e96z+YtMSGjqIMCp8EKVJlpDqgqJC+GX9VNp5WsViivuiVb4u
	NSZzomdZB0B0JIBFF87MIna92h03om4MzWMnvFz4nREhyX0bJsCnxk+/A2dmHaQr
	SlchcGm3gD4pyAAcJcToGhEb49SzWS556fC6ksXtq2BXzaluPQ1bf1Wnzzgo91j6
	iD9GUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78wb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:55:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-901fdbfc3abso16831126d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579743; x=1788184543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=;
        b=PwHXzKfKVKoYQ4qRd3++Qb+OgnTaACrf1DAJP4i2gieS3kOE47f3dzPh2+ZDhJDF0/
         kC31PTsyPOLw86u59LpkDnWhnjOB1LX4TgYaGYX6pqkZwDQ+vHg4cjn6OKSaw4UnsizV
         75+/S9yn+hooTyJU7lUPV0pwzY/x0zmgx7KPdZRyZm7dpu74szQ9Piacv6s7fKcTCdjq
         C85Gy8rgVv5a1h104vr6IlKrgxPmkF2PZIAbYkFEH/JOWGnjBJGy1zIq8Uo10sbEy8zk
         L95Hlpm6X6rXLPbgOXvUwdcAyFiMGbP2NBK/zS9KNcFrcaDgNrMtaCWdKvDgUAgjr6Td
         5pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579743; x=1788184543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=;
        b=m/amm8Z7pJGR/QvpXCYoplG6+ruPPx2mOd+lJ+pkxYpVoiu58b4gjeE+2dFW94gcMm
         SKcMs+7/TFLE96d2R38rhu14Z6d/GaWeq95OaOGwSgPJzQDQWbZdMi5QR9e6qt7TguDV
         0BXIDQsGVhtOiWIwPiyUZacG07/C8AGj7KwfnP2zy45FlTy4XRLSw/A7aWZi9+tEEKxt
         kD2EeKASX/GaFgDK3qdI6Tj/shWOI/trnip63qrVtHdtPzWZ3G54CNpV4QKyYy67ZYrV
         N7h7YcaZh7oT09iq25oIzg7f5Gyni3I2VVGHqlyCSBIhx6MZoepmHjcuz0CGDdWlqEZD
         biRg==
X-Forwarded-Encrypted: i=1; AHgh+RobuvU7Fz2Jwz+heP7YDpL/HFMkXPFRGGwnZfjHLFx8JpMOL6inuzSWvMwZQrsg5Coh/PfDNFunxRXrIDf7@vger.kernel.org
X-Gm-Message-State: AFuF++mGfZ9GlXI6DPzQlh19zzHlfL+Vav/wKaq2OqVKy5GZOfw3Utf+
	xDyw5cA0qwyAmmSuUvElmpi2qU8xlrTzpFQN1fydqvoM66f6a9tgpJWsRsaYHvMDjxsxYz9G5B0
	QsuT9BW4k3NMgdJTc7U8bonIi+bbHeVXxPM7BptdVRC417o4rafQMezhGRi4qaHOzFG3c
X-Gm-Gg: AR+sD13n7q987tWItn/27dGxEDze2V6oL3kF0oCOsjcq+ANOvuc54uaxITgavyrO70V
	JZ1fvtuFa98UGryTnLCdilDl++MTBKOhdaxJ/Mo60/NbIRWUY8PbJ+lohKz8YYAIORRvQvfmoxA
	Ur3g1l1yR/Zl6Ej+pcevFhEs5nCT6wD+WQy7yV1wOc0HRHDqiLeFqYXbbHanq05erjdZkioDLHJ
	hT5rSD+lt7St2i/aoYkcDAw7kRM7Kigaw4A379vBj0xpwQbFsWH+fmAnseROyf7Z6jw1cWbWqhg
	lPGr9wc6GiypuerKy+ijgdNDfY/hbTqoRTTtW3E8/FSNt7Ye1lsHQ813dUlJaQaxVHJrvyIt7kx
	iuHGFCZ61masLJsHCk8HsCL/q
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr196841521cf.2.1787579742656;
        Mon, 24 Aug 2026 06:55:42 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr196840801cf.2.1787579742115;
        Mon, 24 Aug 2026 06:55:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968665e0sm1141632366b.53.2026.08.24.06.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:55:41 -0700 (PDT)
Message-ID: <93960f67-760b-4667-bf6b-c99b021263c0@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for
 Nord SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c4d5f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ybGuUY0XYtVVdYjWugUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX/dsI6Tz27eXq
 RhCav2A5YWf3ZiAVD2JDXO8XV718f/XnmupDnGJ4HvE15WBQ1IHjBogMIIoaxSzo8CM+deuCZib
 MT24DX3v4k2Wl7gTTk4/A3rdWfvJvCk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXwVMbYKz5/o9h
 PMZ5dBOyzmdlt6hQkqV8Nio+igI8Fxkef8ZTzPqfFNXF0X0VINryHrhnk8XT72nca6rYXS6o04y
 1hbFwU5VjpBT/5B5Q3s77qvic/2tVe5nx8wlim5MbnpXzX/wwSnstuBsVFYLi7ckc8GCORKfir5
 vT0dCmgw7ysen71kRrEDZJ0g6f8JMNFHdrTUEUGrnY7QXSPiu5kvW5tUn5pkiHyb7nGdKZ19n5w
 t5LXgeFTpFxXHmJjNBagxFR4TC4ZREc9vM6sAswWYCXMuFmMRJ4PIK8b8urpUfV3KL8wntGdqVJ
 2pnZycQVFge6Z2VyzMT6AYSNVqNdxYs1hORrqGNg4a1rcQbNFlJIu7t9Kvo002egs6bx2qeuZQb
 aM8U0UtMrnM6c4VIbDyItB7fAuLIDEpLVWVnNoUbDpKM/CiKvvgxx4lm36WsF2VViQwI7tE3sJg
 kjpl+j9mXix6Du5TOAQ==
X-Proofpoint-ORIG-GUID: X9pfYNq4QHKDPEsIiZDJttTzyTf4rpMu
X-Proofpoint-GUID: X9pfYNq4QHKDPEsIiZDJttTzyTf4rpMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240116

On 8/24/26 8:53 AM, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clocks to the SE_GCC clock controller
> on the Qualcomm Nord SoC. These branch clocks gate the config NoC APB
> access to the two EMAC controllers and are required for register access
> to the Ethernet MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
