Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5886F3FE35F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888491; cv=none; b=m/PKf/yAnNLNYv9y+uqgefY974WOZy+I8fbLjMH/l3vtx+UjeCFYCOpBJdDyVv8c5d9LIRVOp3fJmTTGin62Mp0cyEyyxe6PTSab+ukMrmXwwSp9seSDiw0ee3qK/YvhjAYuEN4/bg4IrxU5YulImZDOpwdKUkw+ibXp8US3WUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888491; c=relaxed/simple;
	bh=q1oblOkj7poDWcSWwGH1w321C2ZAr0bIblEbMz1G2zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxuCfFnQPMOR0yjHvLJ9EtcvNcf1gY6/HFyBdGLN50TwO+RK9G3u+EQOrBwJ4fRjzXmEl1iEf77EJCyohnHDQkHJaZ7m3sDBAPrn1eA3i6RbbVYtKWFMH9FYz7TTSZsSmAsPGdIS97HwxtjffJ3iRa9/bS0GKe1q4O2Rj1JkFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBIb3KVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYhvmhSW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBIb3KVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYhvmhSW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7Oafm015557
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbbCGSENzLdyysmZk/G8+58k6DjLr1RfZM7tBsJxVt8=; b=MBIb3KVDJqtoJ/Eg
	quVFBkcmi/QlZ2wREGTMZ2u8ktO1FUBPFKD9WZhIsxadbEUVD4/Azs8DFqylZ+vr
	s++CvBUfFAhKfWV1JNTRcXpxdB+Ewt22/CcNeWKY9J9rH+0HEel0DxuPzsXQN9ma
	tyULTsiANaCXHEeSllz0Kzs7gRCN8pMFasoMoYcU/1iqrgEY9Sf+UdHFStcrHNiH
	yezUTE1/SYm1IFDgJqNxl0qwvTBfIb0Js3u07/bpCpW+LR+QxIOehdf01i8GK/Nf
	C9e9us3gQLxW05yY6RR38nJO9SICIWNNEw/QzwpDa+2LdqfSPLiNQfaBcGB/VHNY
	9ianzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uguqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:48:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338a4075d3so9928801cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888488; x=1792493288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbbCGSENzLdyysmZk/G8+58k6DjLr1RfZM7tBsJxVt8=;
        b=YYhvmhSW8TsE2/cB/gojl7QQpb9qdZDDDq2gqhtTDQLLdGwRv/D6laRDGPApGPn1cQ
         hYck66mfAM0nDeYILKxsE02rWAsLcTnNuX8UXLIaJvsJbO0YribeowibVIvcvRKDonIf
         Dx55McxjXskHl/Qs5SFTx/IKntUmQ/zVKvoJ/KlK6a9GQmdtyilQzEAEwdLk869XKEOo
         XUSYnq5v/ShK2mNNwWCJ1oRf5j030/RX4z5u0cFjeDeayijnTBtX9ycRuySUl3MIOoaS
         z9FrpdAAwj2656WKkkTuKCugLTe0uYDccj3EnGRvywIPVL1YsDnOO/ERXeX6ou3UIYhY
         ik/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888488; x=1792493288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbbCGSENzLdyysmZk/G8+58k6DjLr1RfZM7tBsJxVt8=;
        b=A887lR6uum2o1n+o62rbYt1wlKGO/IjJTAZT2tlqIZXmqDGNdgInK9zPlpPS7Pz3ww
         UgAeXgpP4hZBF/jw5QW2PiHeHAlRaAaCZRTXS/3T2PHFej0VJ7Q8XMsc4MYUY37scYNW
         cScReWlFnYzc/Ny3GhcP5mXxWewl3jLS18LkUnIIK0jsdPZSrjsGrEhJRXfJ2Jq+yGuc
         bYxfB+W0I59fsgMmBgJtFe2M///yMcowjhIvYkcWu+gJ0rnozg+8oy9g5BkbaCKnhCu8
         OYQLDIX41xfQZOqaG82JIhQEsspY6coqVLj9DWtt8+0nX9kAqe2CsR59tMLyrTvlBbcm
         zEaw==
X-Gm-Message-State: AFq9FYJlYrKjoqrEoRrG4zJIoyELOIBb4z7cj085DDwmeVHOjcdRfWtZ
	C+XzSliOHZ2dUKusonckVU04V9sRqqBJcA9aKUcHQmB61bJA6SRx4ki/yg7faoSgdExMBDFUQ07
	RmvV5mcCvzt62WoHxQelXM/zvCV1XrdXa4PPVQF8Xr7OBS1AahsUFMAAVqlmL6hlkn/II
X-Gm-Gg: AYBFou1l6t3rk9P40dINjLiLe/kVNSn+45/chp26Hn+j2tS6rgacea8wUou6YHC681T
	r4J4+IPNMlvrKiYXZQgA+0EI6udELw0VwRpFJF3F3Xul/l0+PF4bkHZ8k5k/nqiKX3yN0K3Aix/
	/fLMJJc3V4uGqX8jDlZ2a1l9I02mTJZsmlb3Zei/+VKYERlsVYkSb+788GPvimnw/EzeV6dg4jr
	Vz6lV8weMEzKilSnnOqarc9XzMXAeDwjLflYz74BxEcojAs3s0g3lPkE4yHRV/r/5f/DqzbB3Ha
	LjF4jNr3J6cEFMQaE9daJAq67rHkPNWA8pKlOPYjxWeb7nU/FOab742qJr6+KCzayLnqym5d7l3
	HncwbKHy29dvNJYpTJ2+c7w==
X-Received: by 2002:ac8:5453:0:b0:535:d603:a454 with SMTP id d75a77b69052e-535d603a579mr70468921cf.4.1791888488500;
        Tue, 13 Oct 2026 03:48:08 -0700 (PDT)
X-Received: by 2002:ac8:5453:0:b0:535:d603:a454 with SMTP id d75a77b69052e-535d603a579mr70468771cf.4.1791888488058;
        Tue, 13 Oct 2026 03:48:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766751sm572939766b.12.2026.10.13.03.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:48:07 -0700 (PDT)
Message-ID: <389ce112-6a15-429b-a8d5-84149a6ee9c1@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: don't fail ACPI probe on a missing SE
 clock
To: Rahul Pon <theflyingrahul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930111627.1121-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930111627.1121-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX3Dezk/rCHeUc
 lna9D2lNQ9VOxw4F9gNeW/KY5gVeGD6F41z55b7uzPI5rt5TpX1gWwgIZxpEKYCmJy08+y2lHaE
 mTFLhMnjIaAQQ/NGtiJxdIKz7bLodcVQMKyyV5lNJkqF/9cCeQ4Z+c6dpT3zxqNxaQ2iz/eW3WH
 RnhCwygtK+wNOcDAEKp8tgIqwrp9itfmw6aXKRDCfHWhiMII+G3nxOeNvGNNcO6p6qx/nK0FJJY
 9CK3LbKCA8crNM8b1Bb78boea1I+WEotEyu2w1SIW8jz2Obho2zH3UmchdHsXgLbo1nkpzz34W8
 MJ8xLIn5ox/JDDd+dfWOR7y2r6/fVv+R229Rq3xHY69UYn/uRuqCTR7d6VISVahhUQdCVhUKAfh
 evTr5wUxU2bnlXoTKCNWyo9M3G7yqYfWbG63I5Awfi8IjzJUBH1RtAqvFeB4+brz25veg9/DggX
 KhSA1lnBeHCmxaT3O2Q==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace0c69 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=24bHpHeKglZJ4w0ReRYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Li8ehTIf4L6LZsxTtGeVS1-4DR9Emx-a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX1f9vKZnzYHUv
 sLaH7eAjf2mHn9QLJzU2AfpBljSVR/QE6vkVX3xRIKzSZNmUfL9D/PT5xYDCeoz4nPdVyja81gV
 e6op74jnROxWnfQkbbVeqCGvNREzcvA=
X-Proofpoint-GUID: Li8ehTIf4L6LZsxTtGeVS1-4DR9Emx-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 9/30/26 1:16 PM, Rahul Pon wrote:
> geni_se_resources_init() tolerates a missing "se" clock for devices with an
> ACPI companion, whose firmware manages the serial-engine clocks, but then
> calls devm_pm_opp_set_clkname() for that same clock unconditionally. It
> fails, so ACPI GENI controllers such as the I2C IDs QCOM0220 and QCOM0411
> no longer probe. Before the OPP call, the error pointer left in se->clk
> would also have reached clk_get_rate().
> 
> Treat an absent ACPI SE clock as firmware-owned: store NULL, which the
> clock API accepts as a no-op (clk_get_rate() returns 0, so the I2C driver
> selects its 19.2 MHz timing table), and skip the OPP clock name. DT
> behaviour is unchanged.
> 
> Found by code review while bringing up an ACPI-booted Snapdragon X2
> laptop; compile-tested with arm64 defconfig plus ACPI and W=1.
> 
> Fixes: 5b8a39dcf909 ("soc: qcom: geni-se: Introduce helper API for resource initialization")
> Assisted-by: LLM
> Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
> ---

I think this fits better:

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 5d524d9a7373..70a3bf64ffed 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1350,6 +1350,12 @@ static const struct geni_i2c_desc geni_i2c = {
        .power_off = geni_se_resources_deactivate,
 };
 
+static const struct geni_i2c_desc geni_i2c = {
+       .set_rate = qcom_geni_i2c_conf,
+       .power_on = geni_se_resources_activate,
+       .power_off = geni_se_resources_deactivate,
+};
+
 static const struct geni_i2c_desc i2c_master_hub = {
        .no_dma_support = true,
        .tx_fifo_depth = 16,
@@ -1366,8 +1372,8 @@ static const struct geni_i2c_desc sa8255p_geni_i2c = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id geni_i2c_acpi_match[] = {
-       { "QCOM0220", (kernel_ulong_t)&geni_i2c},
-       { "QCOM0411", (kernel_ulong_t)&geni_i2c},
+       { "QCOM0220", (kernel_ulong_t)&geni_i2c_acpi},
+       { "QCOM0411", (kernel_ulong_t)&geni_i2c_acpi},
        { }
 };
 MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);

But I'm still a little unsure about how the clk_match logic plays with
lacking a clock. 

Konrad
