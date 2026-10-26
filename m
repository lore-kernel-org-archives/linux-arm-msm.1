Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016972;
	b=OkliP+PVtcREXT8TSaPS71nWciX0ajoUduEw4WhscNGVGVR49N+dp45AE2yvanm4SrE/
	 ti7LMDkHwjSpxGfbsW7RgFXOnX2Zdr6I+o0Pq9NpYdj7UppEUW7Lx3i6NwAh5NVC0Vudl
	 oS3NP3fkLrjKxkIkBlrCn3y9KpYc3TnAtsC0pB9DCMTDXlAGYV2dRENSA026juvHMFKWx
	 HI12nKiy8+FHqFyIIOPS/k38Smlad3XEjHrjHTRDMeJiQsZFlnxkw+6ukCyCyr+xhjeIv
	 a0XQG+CZxoOG0bw6MR9y5YP4PJrq0dSILlTrfBKYfXmER/86vsIirdzBxJc9FaGLeJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=;
	b=dHTcBCIYHDqUigT9ARy1abkUDBzyOC6Ol0aKMRzWf+Cge9N8WxQ0+t0OlL4HdNjqI5/o
	 jeAdqj9yuaZID/IZ1l3YFfE0C6FheD4rLAa6Z1SCuiRFYI1OjNGSJQdHlB6zOYz+LGfdp
	 eRvVYVeBFFt79/FP/PjzLgC4tTKPvlPkcz96I85VoEItRXJX+NpxEpUVMo1T2Y450AZo2
	 Va0iFtaniMcoqMYPuT8FZIFGJ8vwWlIhJ0uLyJ49hwE6Fqh+PZjCMMaAWsIxVMygiYZ7f
	 GVTkj+DRDSq1HJ4yB8C5wPQPbQfQF8goOoBZR6/QhqUhd/DWSKhxi8T3eYX1Qoz51wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTLyfggU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsntLCkc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A5606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTLyfggU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsntLCkc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9hX3049885
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=; b=PTLyfggUoRL1+sjm
	/dcaXJcma7GaQiR9rDSTMAhb8C1uuduWHQ1g8oGnqheBndD0kclEKiPfTbucUCkI
	n6AqYRcXkAii+mT+Qr6pWfKFrkr8BF3iYjk7m/x7PCUAi3WKTgCQjlUwlpsdAxEt
	Bz/p6N029oxMmZV0QJ520ik9Jf3jdrhdUzQ+ItOwnVapESdlHRXSxb+SguRw6q6v
	AV3RoSnqS4pJrRPfJNI4O/hyC+uF+Zw4T7HZ2rWmsbupTHl1dcnXXNzEvMFdJUqD
	HLcguNwsRNBdjYMmeraNyIUUOsrrpPjeVoxvQywEM1IyKqKlM4lOdxfnJ4wTGTi5
	Ksrw7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdda2br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:16:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so47320085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016970; x=1793621770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=;
        b=RsntLCkc5kvFQzOtihmgS2ACBqVKvrwCd0+IOCtikVBlXQ4pk6K/09+3B97wFi9VqW
         3LoaiGLmKVx1NNEXXPSQFwO3qqhmHBRYqB4x2hIZYWCGjUN9DNLvZm0oTF1gHUSAI1pz
         CLciN8Oq647K+gomHN1vR5gU5N42OmygIjl459W1ZHJ3mqXQakW5yeVJnIr+ceOucHGj
         5DXl64eLrtGyVJHCDMZIokktGMG0ZTRXpFU24rzwGvsFCPmUa/NF+iyLssliDzxz3B20
         a1Mb8NWL8sDeZqYUfyaczIClAgX/LLgR8j02EFYfO8xFgQl9L0N+cj2l9h+sWhu+zYXg
         9baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016970; x=1793621770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=;
        b=zi5RW+Pw7vfzj2V664qt00eOtywjWk+wIDkBqESQ4/X0D8+NGPL7i8F2+0NPVRG63O
         AVeltbrICdPR/zK0WsOPvz2tnTQ+vgefzO66/qPI/zu/V3YoZzVuHZ5AVOQSO8JUIs0g
         WAX3wSZAbIW9VgsLWv+rWefPNtkiLZgTw7ybGlDMw4A8IWR/5Q1PJMPli9vYuzJ068Cb
         Ljlqm5kyQj/TearsKxFiTs2UiJHmhe0ujc7w0X5ff+GapQrX9J5zXddcwK/zWtNucrpF
         kgRpc+YP5YCO2QcitT98bELhccAAab/pSTkAFiJhNh7nDq9NHsSmrf0KmkrrrViEQmsv
         zYig==
X-Forwarded-Encrypted: i=1; AKwUvBz+0Y4Vrhp6B2Npm0oGxU+ngIeCm2Fk1INBqif0uLKqyKI4F2H8Q8IqJfws1wvZSOfND3w8CxtbJzRBEpvD@vger.kernel.org
X-Gm-Message-State: AFq9FYJwVcNmNyKKc6rq7TATKWPqQG61nGhxO9jZh+NKew8lk4SQlAZ8
	F/yffKSHnAKM1KyHEgmwc0xiBwv+PMh5FYO75APo48UswCe0tsLNxBONo6owCfhSGqOm1Bthv/d
	pqAFmJuQ/7LuutSuXSlJoR9QrlJwBCJFYEy1xohId1XEJ9Y26PTFGEo3Zw8H+nFR24oDr
X-Gm-Gg: AYBFou0O5HHFTr2p0bpvXfT831PKIGL+yaaipVLcRm2X7nH2rFuOh7KmaQclRbJiwWJ
	PwFfzW5Q1Y2l5ZtiQ9DyRxIjEDT+KZFESztDf87OlOGsFM47bOq1cwCIFCm7hkRcp1vHqNwIXAV
	4jvB19wANJ2lPklisa/qsiVjV3bbsFEqtjplhE41F9jiB1MUWXdc2UpFhMePjv8LGtSvtMzigbG
	SfxEUl6Xev+zrGaYxAjV/ENQHgQ1j0ZGKgLvOk1d9Nigao0780z/ME51UNyP5UJ7ouJ3jcZ6l9r
	m8QBMNXhakeZy5/TyWiMSOvhpzu4ReHOipr2O0U1ae5eHehtj+ZuXdRT2KEh0hZqgir0+REnS5R
	kCLz17UUfXgoXjjkuTZb4qA==
X-Received: by 2002:a05:620a:5797:b0:93f:740f:5a62 with SMTP id af79cd13be357-940ef995b07mr1112354585a.6.1793016970001;
        Mon, 26 Oct 2026 05:16:10 -0700 (PDT)
X-Received: by 2002:a05:620a:5797:b0:93f:740f:5a62 with SMTP id af79cd13be357-940ef995b07mr1112351385a.6.1793016969543;
        Mon, 26 Oct 2026 05:16:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9c0bbsm1587764e87.77.2026.10.26.05.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:16:07 -0700 (PDT)
Message-ID: <673273c0-efd3-4ee7-a008-7e70fdada1b9@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:16:03 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sdm630: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GAe9KpcA4GQonOdF_TLmJnV2ENmKP2XM
X-Proofpoint-GUID: GAe9KpcA4GQonOdF_TLmJnV2ENmKP2XM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfXy2l2sCbNAbgA
 Ae+yYbrbw1j3TvsU9Z8xGvcz3Rwzep9rIbx9CJXBFS8/efxEJmaqhaoziR+UQtISuMC+UTX0LD5
 FNKeu+dToj9aEzEWDBPOeGqDhIAf+5hBWkSmbnk6wN3L6ARuKxXKD4xJQ/UAtzG2UnPgWGFihvC
 w/LVoEMHMg4gznFruE5C9Kc7Cw9dKnFX/Th1z/Y9MO3Bg7NlEYGZg25rqtqJMa5wdrbPpjdvrbK
 4LuYIRX6rjDg92Tx+Q3nrmfm3horatki1HqnmKbA3dPzD7YtLv+RTHfhrSXpGWC0PqpiQI3qr2F
 NTV9d95xDX5wyqBqIW4l0X0D+KvVNIijVYHpegQFpxxUx2S1e9gzAH6LG4nJaYI0rCt+TjFiKU2
 RYr4AGiAIFvia6sqjYTkJc24I6YIWmNAuOQlaS9yMAodfnMCxzY8VA9hK7DMSLQctj6rm/vUg3i
 w/xKdHY7ZqZJQSpvuqg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf448a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HmQ7WK16ZiDfZ1s1pZYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfXy8oPbRAk1ewG
 mYClacjxQVeceJjvEK4k71irn+9cfiEcqW+m0J0sbJzABq9q5W+WL0M08k9z7Z18QS/zCj0p80N
 /9mMizfS1/p64mdUm2Z8LG71iyXM1cs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260048

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm630 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: e8e1fb5c703f ("arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index a41ba0da380b..721885455639 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2483,11 +2483,6 @@ compute-cb@8 {
>  						iommus = <&lpass_smmu 8>;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&lpass_smmu 9>;
> -					};

I think 4/5 are secure on LPASS on 630.

Konrad
