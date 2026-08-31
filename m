Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E33280037
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175596; cv=none; b=JK57My4t+8toX7/Knhfi0A7olfCSxLSsK6VxgvTK5MJVULGZnw3EBgMpbX+IJxxSH8m5ZrbXkAVvpgiH9/hu50HpoUD+4tI4IOUOO9c4mdAFQskUFzt66fWe+dDxTytX5NkUrG70yBhGdP39vWSZF2Feo1CS0NXQFZCTCpNcK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175596; c=relaxed/simple;
	bh=SZXxCQIYWsUg4ahPxedyt07MQGWzfBccOL+3jDOGBDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4kSZ1L52lQhX4+kRNAPBqAzaDUcxEH7zVPRMtvWpXieF92mApLBYfEnkl94WdRl8Fpfhr3xeKanafS8SDucgZcDB2qMTrxmN94rOH671EcBfYV35HxR5kOjz5yF1HH28rkbJ8r/33uweE1ru3KDGzC3Hxgrve2GvqN949W5u0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bc03u2+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SX4tlpZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bc03u2+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SX4tlpZY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAoTj3863400
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWuFeN+BQaevlcj0WqFSPunVnUDxXUWFNKXnkxSodb4=; b=Bc03u2+NH7c4uu+s
	J1dZYgqF4br/6toJy6mLik8ITJ4t7A+mRmTgLL0X8kqvehy8o7bkag09Y4R2S9gd
	D3ycLojvfpHaJL6/VEb13SUY1HfG8unNch4qSA5qtfpTR3bGaHA13Im/4zAu6RlL
	Pcp+1AZqm7JebwGGcQmzLoDtcgDhzzrJ8kRDmHKyO5oLdN6TUDWoD1V3yFrmG8iC
	rpc8GdOAzV/2K+S7qUS8WIi6hczqPOuSbzA15q4178q+vcK6IFC/qmXtD0GoYPN1
	Vx+P71Mx2jDUWbx2Kld/LSiL0eRb7jKKepI3wQAXp1YJM6MyxIip5Rlw+LL35BqL
	u4EWhA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm94bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:26:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so5754720a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788175592; x=1788780392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWuFeN+BQaevlcj0WqFSPunVnUDxXUWFNKXnkxSodb4=;
        b=SX4tlpZYF84vLcnb4D0Su7l3YpvT+L9jDXoPPqAihqGrw1NcAYhlE+ScYpjLBaajbv
         8xUg5uMNDYF/2WeedIHSPnGrGVE8F9875+Pi7QeUsZbuHp6AH4CvNbbf8jfOBLcsxvhh
         7sqIPXg+O0ESt9EapVAirD5Oi2inXH+8Ub/rNDSV0GfHJ4gUA1q4wSIUf5q9pcOKHTBG
         4RUjanjzgZwfPX30F37NmsDTTWVk5jJ8C5iyeUiHgPOkcn0naV90qB3WtNNYp/gIVGVb
         M+N0iHuHtruIGSrG1sQ4MyqI9rAeDDREtQgDAcO1tDDh0kiPEIZ2G+yOqXUpjzcX5uTq
         ja1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175592; x=1788780392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWuFeN+BQaevlcj0WqFSPunVnUDxXUWFNKXnkxSodb4=;
        b=Z0vmaRwpgljzJXiOxWeubOJwFG7/ygZhJNcUfdxZZVrN7qJsQwb+VTHMaE7r+bi1qZ
         fJvE9OFy4atWB9atH39mnCAnaVZ6mWQa8D3Uu8OUjPc6T1QXjQE22ePBC6w/w6SNKl/l
         zNrwt/8P1yksgxYPplEPMyz2caCysBfbygHywnBYun6f0PQ55qbEe6xj54tZK18yIAjh
         zlAoSKWONH9f3fH3iquM+hRIKyzD1M/ZQKVqW114cnu83JHglbdWmYBSbbi76cSGniDM
         h5nehjdxRm1K6Vl0qnHN8RAtAmcpnbr0RaBKJEfOU+0uemuwgOSQpHgbjZm/tl5YIdln
         tyeA==
X-Gm-Message-State: AFuF++n0A9Y6A7xmQC7mGzfaAcMFNvADsoOEPqLU1PUs9LDRtucIGTmQ
	ab2Z+KCcIvNeZLsloMMbNE6BNhk0dafm1Hp5z1JfQtG3j0P6lc8tbwyj2rMxv/CskLBymj5hpXh
	oYVGYEycBc8OaiUYgqlOHaV4PQ9gIuKyjamQ7EvOo0mfgAIVbET4xnS0o3sSRxxj5AbVX
X-Gm-Gg: AR+sD127GE6MhHtJwWoTXWqBNtR+wIMA7j8fuESNxDu+XDs123Z7QZktJXk9bpn6GWb
	Qz8Nq773Su20aiLOg6X4zO6GHG17WfI6wJsRhTKhmcx84feilDjrqHLZ2HBQWUn8s21YQ4Ps7zS
	fLSDd1KP9u9YFuI1ehLLit0VcehUIqv6MsWyR9Pm1+8YiwyFN0ZjzXBpCiSZFEQMkH3ZKiEsiW5
	Psqh47U4gpdOorl4xLkhuIG0fb3wxJuMM1d6N7hQW9LCpDaOUmtve+cSGmalaWk0iD+c3z2G/YJ
	onC/GxFRnhMhT2LzQ/Z/M1BbmugFnnhkgwU7bicVfvfb7bloCOydPJHcFVjMJdHsZHfKfESY8SU
	FPY92PmUtD2grc/ko6vDbjJRzTO1B3zI=
X-Received: by 2002:a05:6a21:a0a:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3d7ad788edbmr439191637.2.1788175592309;
        Mon, 31 Aug 2026 04:26:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:a0a:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3d7ad788edbmr439110637.2.1788175591875;
        Mon, 31 Aug 2026 04:26:31 -0700 (PDT)
Received: from [10.92.160.219] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f99585csm28349834eec.21.2026.08.31.04.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 04:26:31 -0700 (PDT)
Message-ID: <8a61f8b5-bead-4114-8363-42b469738599@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:56:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: tpm: Introduce tpm-qcom driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
 <20260831-tpm_qcom_driver-v1-2-6f16fa6924fa@oss.qualcomm.com>
 <e7f7f0ea-cb63-41f2-93c6-5d47fe4cca3b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <e7f7f0ea-cb63-41f2-93c6-5d47fe4cca3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sGtqCIiLEaJeB0azzqOXAClN-Etu0KgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5OSBTYWx0ZWRfX3/LJgNHQWTUo
 MEsmwNiVMqsnF+KN43BhhEHVWGpm4XkjkdnGd7hSowbwI/yeFcrQsMydZCyW/tWJrUr9p2b0h1W
 eGT/V1lBB+D2WIqNmuJ5r7f5dCHNc+y14yk2aFBF5oiJ4Dt0b6/8hoRLxZlsR9AkHWt/fVsCBda
 XnCYxxt4SXElrcO5faP0CbhoWE2p9bjLuc1QV+mwhK4todrapEktoTRbjxx4LH4+Yww2lNIu9l/
 L5bOV/g7hQMw2wAUiBsA67B3pCGE2s6d/qo1UjMjZEgsO9dsVzVe9yaP0tQvykxM+sEd71qGddT
 xzUt8JAhBcb/CPpUquUTA77xe93KBgl+oIgbc0rCrn1sEFJJCNxAq8Oks4B7AUbslWcMNLvQ0yV
 Ch0A1PaGA4HMIxY93+EOUCNv9HjnE2FXyCts0lXHexkW5g4q/tAMbMtMJWy5pHZa4OrDRMmZgAu
 Nf4lcopmXtpTq8uXUWA==
X-Proofpoint-GUID: sGtqCIiLEaJeB0azzqOXAClN-Etu0KgQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5OSBTYWx0ZWRfX+Xl/lcTcRijB
 0XcOfSoVezPDtqO3nxOpw5OycYKz7xWdUXBpqumwyifBv3I6zgCCetQppqkz7vtdM0jJwkc3PaZ
 y7EQmmvMQAvKwQgHitfIi9P9jSNESGw=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a9564e9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=I8atxffxcjRlebx0Ix8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310099

On 31-08-2026 16:45, Konrad Dybcio wrote:
> On 8/31/26 11:43 AM, Kuldeep Singh wrote:
>> Add a TPM chip driver for platforms where a TPM 2.0 instance is
>> implemented by a Trusted Application (TA) running in Qualcomm's Trusted
>> Execution Environment (QTEE), reachable over the QCOMTEE object-IPC
>> transport.
> 
> [...]
> 
>> +static int tpm_qcom_get_client_env_obj(struct tee_context *ctx,
>> +				       struct tee_param_objref *client_env_obj)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	struct tee_param param[2];
> 
> nit: Reverse-Christmas-tree would be preferred

Ok.

> 
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
> 
> You can zero-initialize local struct variables like this:
> 
> struct foo bar = { };
> 
> [...]
> 
>> +static int tpm_qcom_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>> +			 size_t cmd_len)
>> +{
>> +	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>> +	size_t rsp_len = PAGE_ALIGN(MAX_RESPONSE_SIZE);
>> +	size_t copy_len;
>> +	int ret;
>> +
>> +	if (cmd_len > MAX_COMMAND_SIZE) {
>> +		dev_err(&chip->dev,
>> +			"%s: len=%zd exceeds MAX_COMMAND_SIZE\n",
>> +			__func__, cmd_len);
> 
> The name of the function isn't helpful here, this is the only time this
> message appears, so it's easy to grep

Sure.

> 
> [...]
> 
> 
>> +	err = tpm_chip_register(pvt_data->chip);
>> +	if (err) {
>> +		dev_err(dev, "%s: tpm_chip_register failed with rc=%d\n",
>> +			__func__, err);
> 
> Likewise

Since it's dev_err so dev name should be sufficient i think.
Let me drop function naming from log.

> 
> [...]
> 
>> +#define QCOMTEE_TPM_GET_TA_VERSION_ID		0x0001000
>> +#define QCOMTEE_TPM_TA_VERSION_GET_MAJOR(ver)	((u32)(ver) >> 16)
>> +#define QCOMTEE_TPM_TA_VERSION_GET_MINOR(ver)	((u32)(ver) & 0x0000ffffU)
> 
> That's FIELD_GET(mask, x)

Sounds good, Let me use FIELD_GET.

-- 
Regards
Kuldeep

