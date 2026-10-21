Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617374;
	b=Qx3MA6WM06T1bdBAWWFq49OkPnLsywOrP6wvPUuyh94pJZdED6FLta+iEx5N5mIvis2S
	 NhMdI7VJx6pDFf376N5KinEKzQABD9xefayYTwWpBZem+VIA6rIDsYpcSZFZ+iOYf4LPe
	 zVpdJcl/52cfHDAf3k8tGTQ+5e/RtHIXWtFT8bQW808LXXpF0vBQ3nOfdPv7SopQeu10J
	 SVESpxzXZGSkeIvifZ92Qbqq2TVRXaVCWOuhxLzanqq0kRd1u9gdpeB0s7DCdQ3P91EJ8
	 lbk6Os1BBz1g6MK1vauuIEM3mRiFHfxJedlOtZPkEblYd/BlTi7VIVHk4dZud+iwoxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=In7UWKZFYC3zSnJsQr1KWQoGjjGRCbWkVCXiuO48ynQ=;
	b=2yNDYY41m0BI47mSgmqfe4lkQedo3Z7x/LFnDKPISrp3Gy49M6w7wUUPrPK3hIcmFjlq
	 TvAKB5P/8ifKYZko7/rO1zmSehyOkPx5vHHX/3qGwxboJ1JrCKvcGUly/VFBFXTKIW3Ke
	 llAzTgJOWB5f754uWqENu7p9TBH9309x3ql09fdFtyrrjhWiYR0RBnsoSHew1wdJzYH5j
	 vpksb68QjE1pMO4dPh7T6y+OTKUAY7LVuCeo5t2ougcWxqSA4c8efcJVPhXWoX/yHDmjL
	 zShEGT6/B+4dRLnf0TUWzhbMvqCaYtCgtPisXbrlAfBFEqeYUdhnJBj7BWpxiuh9Udw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e8p3urDB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ii5dHDNF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E2606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 21:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453E2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e8p3urDB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ii5dHDNF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeN8T207543
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 21:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	In7UWKZFYC3zSnJsQr1KWQoGjjGRCbWkVCXiuO48ynQ=; b=e8p3urDBkNn0Qwxu
	QgKsj7vg5qiGp0woOOXU26cWe3QNGql/aNqfrqHIOYv4AoFUS2cFMeU6a6PxqbsU
	eEfhqd47h2mv+C+1zrsxOhkeL+FpAfEJBJPTPoq3XAuIul13mp2JlR2EkrAZvxyq
	jsz2l4Cxav82YO1G3bRILzFlGijsWe66daleEr3yPviFTOGTGkOrmXao03HfbwAD
	pmS3YQeGcytTBSAWfO1PIT1w6PQadUVV71mmZT9yel9zEqNgTxU1z0UHnrS1TnHB
	Z1/1Or3rwbCKS/dyP2ljOhY1i+FBPnaazXxlGkGubngc8LKr0QKtBYZYSjDAeDqs
	QvJdRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7b4ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 21:16:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so1864096eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792617373; x=1793222173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=In7UWKZFYC3zSnJsQr1KWQoGjjGRCbWkVCXiuO48ynQ=;
        b=ii5dHDNFCcx6wDZI3O8lD0I3rJEIBZ7bjDN9BhEAzRYmfBesqxGzObeBeEIMCiAD4J
         HC7aE9fgtIvDs8RahcHAnFg4Z4/XylMYbTa91Lz3PsyJXBshxARKQeQMQLsed0lg29Hy
         tTc3AJghQDk9yLWqE3lcRdRau3x8LlqgxdgKAW1jiEzvEcDxOh2tswDX6mBuU2wAIgze
         5YFnQCKnWhxqfJpQg2B29YKEPAGE08Bxb1CXzouFlRZgNsomzSXrNjc+o4a2+AxrbKiw
         Y335+I1d6PGfKyQfNvyhqB+sTdtiRtA2Z/WoArqjZrxMlTy/KxoIdh2YvY27CvDwiqcU
         Cc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617373; x=1793222173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=In7UWKZFYC3zSnJsQr1KWQoGjjGRCbWkVCXiuO48ynQ=;
        b=NEk4knPyOV8/ZV3+ZQ96LWnqEzVZOdf2mTeh1lLV0hsa0pG6Sw1GVYpQzVufA6yx7A
         HutZwgorhaZX7JN1Yej5clS9Q5OaN9FY6+3u9cf5Gveh8jMBiqL6ilQEj90/Ajb43RPv
         kyQnbOQ9wNUD32CNIAD4WB0dJIOWd9gLvdkOm4JahocrSrroOkAH0Lk/3IRCjYk1tzeO
         tuYdzpjnddXo+MdS3+3ivXeEZJRaQpnWZ2hOESfOxIfjCfB0Vm3PyoIInDfusgRb5Kpv
         vIec3I4jpjiF5UzQ4p74Pk0BFA+DBcDNTuaVEnL/uiuxjER5KCLcCjSgumm0aKCeymUS
         QbmA==
X-Gm-Message-State: AFq9FYJgXho6FE/RzjnxEWbvn3xjLxn+pBUL7fPNRR0hQkudTBcMp3xG
	FR3R0kBvM2waVTd2k6sVPw5Yk5ff9DjH1fEm1b2pzorSXhhiUXNG9Yad3eTINBOIHbG1R7fBm/F
	ij+zpvL1p2HGwuktvr7EFiIG33imLcIVirJ8/4vbaxOX+uN7TbAhjOam69/AwuUJgR9M=
X-Gm-Gg: AYBFou0YcLemF/jKl73G/NE16q7yohvmBe3QL14aHL8rp8hvXVDSG/bRHyt+Bm+GUC7
	6x4rXfbjOZdaOTBzaKEEHaCOuF55c2c/uGqLStUAo+qixwxA5EROn9qj5U99hnU9EmjqzxlLiTl
	sk4RvQ1UCmIp61CgMbeWArCZXSuNi64eNRkuDHJeY5zVu+em1SfE2na2oReBcBuqurY5ZHl7zrt
	moSy1oRDWickWY6RKwLdoDbyuVyH4rh2SXfVDNREF/ZQme6w3SNYmva5wyBGljyw/Ouot9Rq3is
	zWpeQX2F/Tr0rH+YrCABULBMYkyOzRLJPyHd/lCcTS6X/9ii45dqea3XUYmVmA0y0rl4Dxfs/ok
	gb7Rw5UgWcmG4umQ6ElZLqPPWxCCvJPk=
X-Received: by 2002:a05:7300:828a:b0:367:185e:867a with SMTP id 5a478bee46e88-3674f21c1f2mr4409478eec.38.1792617372469;
        Wed, 21 Oct 2026 14:16:12 -0700 (PDT)
X-Received: by 2002:a05:7300:828a:b0:367:185e:867a with SMTP id 5a478bee46e88-3674f21c1f2mr4409446eec.38.1792617371755;
        Wed, 21 Oct 2026 14:16:11 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.13.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741f753f7sm9947297eec.27.2026.10.21.14.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:16:11 -0700 (PDT)
Message-ID: <ef93b833-68d0-46e1-a777-d7451e50da4c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 08:16:05 +1100
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
Subject: Re: [PATCH v4 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
 <20261019-tpm_qcom_driver-v4-1-6889b9804ba7@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261019-tpm_qcom_driver-v4-1-6889b9804ba7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mHTMK9-Ql6rWHg5v1CbI4hmMA7C3pJO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4NCBTYWx0ZWRfX5TbL+JbLYodr
 7G1m5XdzvD/9il6yk+3aAmyBtP2ZaITIC0vFtijrEC0eRdH6kdC6oWrXMQkwuF0YUBuDMf9nTPy
 5ngnH58VkVRIBKAVFhA4AeOsG2rf7QRyHXtRZM5csCVd8vuud7ZqQnuUA43Nzg+9m/rBnM+DCAQ
 Pbr0WXjP1hIeP42bLaY0PlflfzOi9EK/p6gNjDNOiqJTqAN9GevSmpIcMmQhYeshNHNY8gprPYF
 UxS32Jnj+vo1OSf/n9ZcNYWgbk8Nw50Ls4rlRxmlOzFX4iq5JztMGCYLY4D2oGdgT7Z4exqviNH
 VJHO7dKKlOnJLPsKG2u4ODTpnHvZu0r3mdq8crWp/wMgC724u8mGb73bfDRtNURWni5Y0nV3J+n
 UNjv+Oox/dtTaa1RRpXKEBtQZXvNCe2W5COsifx2PLOTXfat3EcmACx9HpW3WZZFKuVyT0pTxxR
 MV2FnKGrZlmWp345lng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4NCBTYWx0ZWRfX7nf3WJJwhWfG
 UMyg9T90H43tzjeG1H+XWbMFxGIsbAD1BN0MM3b4a8ea4nj+sK/1pd15OhdUSb7ofSDanGt98FT
 hutV3UqZAcdaf2tJFK7uPxMiEK1YNi8=
X-Proofpoint-ORIG-GUID: mHTMK9-Ql6rWHg5v1CbI4hmMA7C3pJO0
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad92b9d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=DFNpOA17G2bluAzxCnbuxw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TZTEVhZfE5fPnIgvEYgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210084



On 10/19/2026 8:21 PM, Kuldeep Singh wrote:
> Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
> is enumerated as a TEE-bus device, allowing a client driver to bind to
> it via its generated UUID.
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Looks fine to me.

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir

>  drivers/tee/qcomtee/call.c        | 4 +++-
>  drivers/tee/qcomtee/qcomtee_msg.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 47d8a4f9a159..1b887da83341 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -747,7 +747,9 @@ static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
>  
>  static const struct qtee_service qtee_services[] = {
>  	{ "qcom.tz.uefisecapp",
> -	   QCOMTEE_UEFI_SEC_UID }
> +	   QCOMTEE_UEFI_SEC_UID },
> +	{ "qcom.tz.tpm",
> +	   QCOMTEE_TPM_UID }
>  };
>  
>  static void qtee_release_service(struct device *dev)
> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
> index 9278a361dc70..9fff9dc5fffb 100644
> --- a/drivers/tee/qcomtee/qcomtee_msg.h
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -106,6 +106,8 @@ union qcomtee_msg_arg {
>  #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>  
>  #define QCOMTEE_UEFI_SEC_UID            413
> +#define QCOMTEE_TPM_UID			81
> +
>  /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>  
>  /* The message contains a callback request. */
> 

