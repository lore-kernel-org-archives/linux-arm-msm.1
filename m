Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B033F0773
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563652; cv=none; b=CMcd/bdmjmcXI5idfeAYpOvi1b+DfQForcZ6FkWaPsrHxJXe04DZaoXrfBOMOmHTsixZbYj5KkWabDs8pdYOjf2qWzT7L2PZ+Z92RsM6Y9rAMvlswr4WitzU82Ql/zbwbzCijMN/tsgm9x7rqnWyw84XAP0qXZx+lcqi9z2vI0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563652; c=relaxed/simple;
	bh=K6gEvXZ2Etud0O0icHh8PzWAW3SMPp7XO55uQExUCaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIjqU2e2rO3uJRxawAyRSi2x8O/lRhr9OB5YA53M5a366qN/IqfAOFXF/LrOkhqJnrFMYcFR9uiVcVmycPTKZHY7ULdvaFjBTnbvmjAUHLnQG8q628WDd1ZquOjTg4FbqONcoa8flP3x3KkbGlpOOptcHqyRrxO0f6m6Z4e8byw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd01eUms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQ60nG9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd01eUms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQ60nG9V"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O992GA1377876
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSL8qk23Y7FEh/hAbYGDIl8ENh4eyRnJwA85sstD9kM=; b=Nd01eUmsJ1+fHFHy
	k0hyQ2QJaRDGEDMBAYbegqBbpr8pwRQYsbwImGnrpJrypz0/72XEnkwH0w3kobK2
	wIgK0uqxD6fIuueakKXfwH4Vk3XUJKu/bd3TSYUVyT/urLdDQ+FgiUSvF/5cebJE
	5ksCJ68/5mMJJ6Qgbu++JLrDyQP3l+RCaV+2gXrciXffb2DRUCkqDxetVGNooVF8
	jTUOG0myOVvNbLNxISbPAJNb4KQT5eVEe2Jk3jHN1YPvjVgFYyrCAj7SWsCUB7D1
	xRdGkEjpEBywVU1hMYY8SdJbyyXbZGZXfsMhnPm3GWl1MoHbr8rqAieaaxudA4ax
	UhApeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0h2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:27:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so3902611cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563650; x=1788168450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSL8qk23Y7FEh/hAbYGDIl8ENh4eyRnJwA85sstD9kM=;
        b=XQ60nG9VoLbNJCPGJ6NMP/KxJvD1ZKQlZQ18wmwwBfjogj4w1AQafJnaqtURQIGOIw
         ZfLLilddHNK1uSjmttVUQpKxz0TcQ/fowYO5bxYJ4JOvEtdozaVVVORAUWhyQAoJeW2e
         svOGmRIhIptVSAqqFX3Hg5daR1FP3UjMWgeG0KGSwpgXaSCc7tMvPsbSMILRbIyNIAJZ
         blXoqGkwQRCeIx4XiNDMxw9IJsFj8OW1GmMHj3HH+xOG5dRe+fgITl4rvVoAuM+WJIbo
         Z+KI3qJR1gsj7hZ2e7fq+exuJ7WNP1UQQYNgXN2668tD6vnlRPJvC+Xunml6GsNWjFhN
         wMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563650; x=1788168450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSL8qk23Y7FEh/hAbYGDIl8ENh4eyRnJwA85sstD9kM=;
        b=dsH7BljTMgVDAwI1uNgYkNC7cElIuLCZo5qHaND4AMb3zbDuG9qZwV207HkiybncvW
         vUDf34vwpQ/itbRWIkI7Mg3HlH0ofet3kcz9lC+iv8Wx6xzI8JxKllwyK7/iqXQVxsBs
         kZ5AUpUJ1k9BBkae/C4ixmNDDKnkvbyA2rJb4WK0raHmppmguKnx95SQ+6w2Fe9SUVFq
         ObEcXgek3ZZd+zGFloUQM552+liUHwxd5KfSWLRbUGuUTv/w438HVpILXTW0R/AZS2m8
         0BdVP5CQ8I7PH/u1YNy0/WNSY7MmDW2kMAdUsiMJXkn79bCXeXhnt7HbuO58sFUoIbcU
         2f5g==
X-Gm-Message-State: AFuF++nCXKK2aqK5N7Of3F0QwpVRlJZRaI/4PJSBahelzc83Cxk1l4NK
	MT6V881cZVT+Ai7lcUdPKngZiu5lfaOp09K3B6dwthZZjzSD5b4hbRVibfBtvdMpf6Lxt/Y46lC
	tYNQ4RPhjU1q8JQuCaAjanbVx6Wh/jGMiGbfpKefEVvrwN4qb3UxOXjk6+4tdb12pvCxZ
X-Gm-Gg: AR+sD12skPOczeT8z7E8vZT4r8u8A0PkRwsy4BjOQqUAxNt/2WfXlDWOJlUJrfRVgk/
	dszRHGfNCn60Fi88gAWdDI6joNuB489uJlSN9xxThgKN2gYoU6/dvhrhYwXG8VF9HuNsrTtV6M+
	sJsFoWGTwWWaNzs9s/N1a+/6XVFQgudP2/+WGKbNlGg62M2z7Kfifv9oCi/T9jLdqm4bahKQEUI
	rwQ5Rvv2jDaZvF/7cnuzpc0y2ll5yI/LshnTe4hGjk0Em3KVzc07Z9zhtPXqUdVpvRosApvkKhE
	8IKNnavWNWmBr+gFajeNENDWH6XM+EUNX1x0/L9CrhpuRxauqmK+Ibwe5e6LDqnW/WiYXmojn16
	mcnB9v+XbmhBNNT8mnnfbWk8L
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr182010291cf.4.1787563649599;
        Mon, 24 Aug 2026 02:27:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr182010101cf.4.1787563649173;
        Mon, 24 Aug 2026 02:27:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6ad2sm1177123866b.30.2026.08.24.02.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:27:28 -0700 (PDT)
Message-ID: <7334c260-0130-453f-8169-c07a3145aa19@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:27:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth
 UART pinctrl
To: Shujath Mohd <shujath@outlook.in>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <PUZPR01MB514105672CE6BD050485EEA2C3DF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB514105672CE6BD050485EEA2C3DF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX3rkC76Or6cPW
 qCU3kSBpxdQGs6aw8Ge21SbbZMI33jmNkYIoKal6HMP7FShnjoQAHudgnonQ4JTT1/8qS6iwOhO
 l22cOAt8Z/oiowxEwW1/nqb+VQZ1+S8=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c0e82 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=L1ubDmCvsYE3eyL8wp4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NkiA9xJmkCh3b-zjhyqbjrw_EBPSWh_V
X-Proofpoint-GUID: NkiA9xJmkCh3b-zjhyqbjrw_EBPSWh_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX6q22dK15K2FY
 PgTOm5OnG4P/U/oscKCOXzux9Gfef4kz5TYLQQQBlb5Xcu3xirApYonPmw18oyXAGoSfY/mTUEe
 Q+4Hsh1Djh5oSEofCL2CFxr5gZXHqFl9TcgtK7NCewleopymT9CGHnbLzfE6S68BscRfbp9rLBj
 cTt0isKDWlCe694NJbrt9B1pwClvdz2WoaeoxOhSOx2seM8poskfYyorfHdjyG7c10/W3AOyzxn
 EJCu5TUfvmyqDls27He/NlakNWERjt1JOeMVTLe5Ebwwb3L3D/IBcOV+V9w6MyZez+03S87QBI7
 7vc2UpOveSgS3Amsn53u+isae+x3iHA1pvnRbup1yqkLyNLFVnds/vJJDpqp/YFGYwdxAv4yHRn
 xYV2g+UVsVBeWmpr1HvAbND2L504aoF3h46dD24Iz4lfsgWuECU7DBFt2ClnqlUrwzD2sO8+Wv+
 ujOy7oKnKqAQtgW/2KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240082

On 8/9/26 3:23 PM, Shujath Mohd wrote:
> Use the 4-pin UART6 pinctrl configuration for the WCN3990 Bluetooth
> controller on Sony Xperia Tama devices.
> 
> This enables the UART hardware flow control required for reliable
> Bluetooth communication at higher baud rates.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 14663948d4c8..395e8f1141e3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -775,6 +775,7 @@ int-pins {
>  
>  &uart6 {
>  	status = "okay";
> +	pinctrl-0 = <&qup_uart6_4pin>;

Nice spot - could you please resubmit this with a slight style change
and add the following tags above your signoff?

Fixes: d54331131cde ("arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth")
Fixes: 30a7f99befc6 ("arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)")

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 4c63286d8b04..05e5a3674e5f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -754,6 +754,8 @@ int-pins {
 };
 
 &uart6 {
+       pinctrl-0 = <&qup_uart6_4pin>;
+
        status = "okay";
 
        bluetooth {


Konrad
