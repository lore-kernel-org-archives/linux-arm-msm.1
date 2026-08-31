Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593C3DCDA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174923; cv=none; b=hjWyYktrWQo0ZPMFRZ/h6CXYB6pwbLuz+Us8Dh6HZr4CMyu0rNSbQFhNmNeJftzXpnauZRq10SZRwRLCE6z8bzJ3UAXqZIp5dRI/jn+a1MvkaZ8ev/T2inXnvJtwRgGzoMLpDaJxFdT7kkGj4C05sKr2IUcYzEXt6rTfBqi72uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174923; c=relaxed/simple;
	bh=8ULGEUNNJjvyNdM22e7Tq+wJQwAaiE78urMxW652MuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yb5yPgAAHS07NY2G04mNI4fjY+lsNF+QWo6tvXB/3T4ZGeQSwo6lBhT+x54mYu17yJRsprTr5MfDIy9jfiNVGPgRLhGC04fWIhez3LiemH8Pc9aTKNNFJ4s4b/iTS2jwj8pYXFTbw9wsPyW/1BzHS8USGOYXSz9hwVYcIF4OGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/ixE2zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKfTz2aa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/ixE2zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKfTz2aa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VB9xX33447136
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YunmAvG2pE66QhekMLMzUPWMf7nH38ggy6Vr0EmXp94=; b=i/ixE2zjgLMAs+zL
	bcCx3btOx/4Ux2/TNwtwOUaRperJRA9AxSnZPvAg0e1ds4JtnacejfPRsY1lCtW7
	R7xYUn+vxZZq2b4iYWTTO2DiNkCeKFcv0dQR75texHXYCRWilBbZmbBlfYWJEckX
	Q9qM95p10/VnqFlw11AsZeTLExTapTqNriqqJu+bmwOxZ0FEULlOIHRSHMq1JLKb
	7k6qiB4ylYmtzpj5/hNOTj4LxEk6r7bVksPrwg7qHlXruSDoJ9zwH3s/vUEzw6NE
	SZwb8dsQDo83WU/olEoagz8EUeafeYTK3tBj7dX3yBWRNFdj4WvOqniFs75AsmHC
	TBCcOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb8esb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:15:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ec554a80aso9777561cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788174920; x=1788779720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YunmAvG2pE66QhekMLMzUPWMf7nH38ggy6Vr0EmXp94=;
        b=QKfTz2aajZXA5SGsVNUxa4XbqgBoOhXLms2XU40ZMIr3Jf4xhQ8DsHGaDYmsAZAPkn
         GtZrIHBIMSlTt5/mXCwsWprVijeruRv35jVxYJ+3GurLGv/nmF5XG7R1KYCszdarXUoO
         QwUVoJmLvn1lno53mq71f3n0hhY8P058UJXaoDGIqDqpLXuwHSFLaaYYCc3YXDyhcDyF
         9dsX8I6VEJuLzrnSRrAoqgjelrivvszebYqxxEzbuqRUz32w0b8YWPvG5EFFrNIQkH29
         ngR260eMwMs47h8X0JpXGE3toCSUa+UppWzZqzLmfKMqQDdaMG8+azeIV1aSZ/VoTPdD
         QCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174920; x=1788779720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YunmAvG2pE66QhekMLMzUPWMf7nH38ggy6Vr0EmXp94=;
        b=YlPxFXKNQdEQG15RL2y3mjlGxbUCq9HoO83us8tY21RlEVSLSuIerD1QrUkTDm3m4A
         EEvsgya/UjbhCBEJXpo0cRk9khlcvXyRVYC//UMzME+PtXl+nqo1+kQvHHG9WpFlwTzV
         I5JfFF57zu7r/Go0pW/48SDVU/boNfUMxrB7ox9DywChULVBt4V/FGOq5FZM6jjApskJ
         8kQcNH1Zlw8HBKmVqEicrmuRQ+Bj1B9SN2CY27fWVtff4WZP2DoOhRTJsMSv8i4a6DuS
         T4W4gLlnW5U6Yb9oCJUgAal4MKUlMKNjC2cBXHdY8/b1Nen+ASlxHj/xz9bFi4TOkfM/
         zRmA==
X-Gm-Message-State: AFuF++m8EuSXsfDf4ih1vET4knZ7Ch6BWxekdnU7J0WjPePRCcjMjV2e
	U70t97L4RfuZz6BvIn/jTONlxa+pNQoiZk7KAWcMXUGmcLQY2OMAKM+p2XsTVkjaHo0ClSm4n0S
	xp8eu8PwrWT2VKASSv+t0eNeKJFBm4jUoNiV/vY7MASRzHCdCQVe4qC9TQM7toc14J6kLRp3vJX
	1B
X-Gm-Gg: AR+sD11BNwyGEbWCMZq4cLQ7Iy6rVBn0PEVduHwKMV5/aqrlCHZCpOme3SyM5lhErAf
	fqBUUTDMmoPWFXZM9tjhkB+thWG1pSwvSJmrxBizt+pT/J4p+LPT2Z5Ed5FGY5osSG+JVDs1nQH
	1t0f72TZ9CZ6T9EHuoz1XR/cmZ0hMUXb0aE1EflRibPG2cjrFztl4a8cXiE1nE47Vyn973bnT/G
	S1guspuKC1YFvv0FTxpvy30plE8FBv1mhBQ+BHntjAmzlrUKx5iCxRBv7Shawv3BPKdf+3/F0Vb
	F9nJwc1SZLX7rbaiOFw9Lb1Q8APHtGp8JB//ZDYq8xIqljXxp+wGMy79kggnUgb9loE+ruFgxa0
	sauW8zYYIA1u8NqiQ2UrIow==
X-Received: by 2002:a05:620a:45ab:b0:939:74c:f122 with SMTP id af79cd13be357-939286884f8mr854290485a.1.1788174919566;
        Mon, 31 Aug 2026 04:15:19 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:939:74c:f122 with SMTP id af79cd13be357-939286884f8mr854275885a.1.1788174918130;
        Mon, 31 Aug 2026 04:15:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25895beeb8sm212026866b.31.2026.08.31.04.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 04:15:17 -0700 (PDT)
Message-ID: <e7f7f0ea-cb63-41f2-93c6-5d47fe4cca3b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:15:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: tpm: Introduce tpm-qcom driver
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
 <20260831-tpm_qcom_driver-v1-2-6f16fa6924fa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-tpm_qcom_driver-v1-2-6f16fa6924fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D2MnHQSUhjob8lGBoFOOUbEcqPIDy2Ei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5NiBTYWx0ZWRfX+Tam6fSogADh
 D5D7VxULcCa3jwiR3z3NhKqU4HRdv41h/1i6w9FNfJ60U1U2raFqq1eDK9uoaRZY5GRrmDZ/5tI
 AMqh3ZQFy4Ompdzvvx6BcjYZpfHf5aMBsCOt2ZVtT3DPT+aATQwwOdeGhSdaWRCAno+TKFN3bcU
 rDjR+Nmd7y0tEQgNZB72noZBzb7CZugJJlw5bFwfwcm4N0fWLDZIeN+roIcRFD3GoC1qhPpFwcK
 NV0EpqxgXsFXZvH8prLIHj1ekKivw+hwY9vdsKfVjqIgdkLTsZXYq94loLd6O2p6A0dTfzMTGR3
 o5zUnua4xJu5EL2Y0kSYb4h7KqiOM6O4YRpqlwsawDAQLAS+w2pV9NT9ijyWZ+Nly5itWEGeijc
 NTaY0MSDJNNi/hbjWidNZREh+9SQZcyR0fRBjnCPkb5+uS0AEDDjKHjOQVBl0w/LF+UKnuy6wm6
 j2vZT8r5or0PJlr8i7Q==
X-Proofpoint-GUID: D2MnHQSUhjob8lGBoFOOUbEcqPIDy2Ei
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5NiBTYWx0ZWRfX3aNm5FbAG0sN
 bI1dEA7JYF6ZymckmuBU8aG0Mn2hRyF9mIRg/oE8/kVrMNDBlVXqEFGxwyiqwlBKoAf53A0/5kO
 L81N9JV5pb7nYzQyMMtX7kyhmvPWXnM=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a956249 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=1TzI99NNmMpykW__4ucA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310096

On 8/31/26 11:43 AM, Kuldeep Singh wrote:
> Add a TPM chip driver for platforms where a TPM 2.0 instance is
> implemented by a Trusted Application (TA) running in Qualcomm's Trusted
> Execution Environment (QTEE), reachable over the QCOMTEE object-IPC
> transport.

[...]

> +static int tpm_qcom_get_client_env_obj(struct tee_context *ctx,
> +				       struct tee_param_objref *client_env_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	struct tee_param param[2];

nit: Reverse-Christmas-tree would be preferred

> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));

You can zero-initialize local struct variables like this:

struct foo bar = { };

[...]

> +static int tpm_qcom_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> +			 size_t cmd_len)
> +{
> +	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> +	size_t rsp_len = PAGE_ALIGN(MAX_RESPONSE_SIZE);
> +	size_t copy_len;
> +	int ret;
> +
> +	if (cmd_len > MAX_COMMAND_SIZE) {
> +		dev_err(&chip->dev,
> +			"%s: len=%zd exceeds MAX_COMMAND_SIZE\n",
> +			__func__, cmd_len);

The name of the function isn't helpful here, this is the only time this
message appears, so it's easy to grep

[...]


> +	err = tpm_chip_register(pvt_data->chip);
> +	if (err) {
> +		dev_err(dev, "%s: tpm_chip_register failed with rc=%d\n",
> +			__func__, err);

Likewise

[...]

> +#define QCOMTEE_TPM_GET_TA_VERSION_ID		0x0001000
> +#define QCOMTEE_TPM_TA_VERSION_GET_MAJOR(ver)	((u32)(ver) >> 16)
> +#define QCOMTEE_TPM_TA_VERSION_GET_MINOR(ver)	((u32)(ver) & 0x0000ffffU)

That's FIELD_GET(mask, x)

Konrad
