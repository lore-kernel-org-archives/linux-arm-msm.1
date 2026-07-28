Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C097D344DB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785210463; cv=none; b=TPBWheCyVEQmD+fgpE/3SU3MKO3juCUK8txGHtL4DrLuIiVztduEYbbIqhduLQ5VQVXJwGlMMrAJK2eFds2q1h+oiZjN0NmHm5jBD+qNiNmIytyc2eV4HnFu8+73KwUEtK3Ieu0vVzGgqMmqgaMuq7W99W8pCh3k4gXhHhw6FDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785210463; c=relaxed/simple;
	bh=SUgNNO3nfk4ebdfPQSmFw62HaPVuLhWhQQOFUBQiqfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqpcwVjTYPXBFjAq7+ehqsyZwjrV8dAvtM2uSxr2HW5/vpxPagBX1vAQVvT2vniUT/hbBrh+tr/1PorSs+xsOII6gex5CPpCosACrPXu+UUzi5075EbcLAX2wn0lFiBXFhOhYiMKC/Pkkw5/KxnVBzdfTjpBUTBp+HFi79Y6+qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoxL19td; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9GKcl3r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoxL19td";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9GKcl3r"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3ab841527461
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yo/lWxHJw9yNZPh3KLPiwdIL7Wsz2tn7HHED+a/H1h4=; b=RoxL19tdNYhKSsSr
	ivep5JCeOPtMK9paYkEeGCn2c8PH3H6DYpB5QybV5YW6aaAXRKmzqHqpFQHN0swb
	wUhEsoDsx7C+4QIeU8osOvGyk34/YL3cPBwyBgx6lhFk3V/vXIVz7BagSQo3F5WB
	2/P4fndKqM/zv8i5EFQHj6L02N3BJMJeOVac3/AIwmYrCC+R3HzfYMbtEnTzBDb7
	ido4KdQG5JOVRnnIrEgvSnLp+qbln+LDGpPCZx+scYLm0J2hNkDe0otvO+ZARIl2
	eXSwQi0RLsY7FQin4OAgjeI3vu5Hc9pPCQWk0eRVSUijibPIwoqGado8Fav/G4wJ
	go0haQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8a7b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:47:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so4295787a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785210459; x=1785815259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yo/lWxHJw9yNZPh3KLPiwdIL7Wsz2tn7HHED+a/H1h4=;
        b=M9GKcl3rec59qWrMp1i1ntFudeJbpQeD/VxgJo+mAWyupwKZkFaDADxdskcFYTQry7
         8Eiochd2fJV+xC90mZdlHMdI0/UHbDHU9mm/Xf23y3BYE2XYFV1sCkynchCDPJ1UnKA3
         2KBMNTI7eLQPPWCYlwrHnz4DI/jB2/C/9OCOYF/k6Tnr/TaGZjOndVhWxm/G5hK9clZZ
         vHrApzkkko9p2c7wGTGrsjVtffBqUIpRxX9619KEo+TxW5JirZxh9N5dmxj3DzS7CCqp
         Pa1UEsDKEppoGtrdK4q/YbYfqdxZtOKfjvUMQRt2QQ49grV06Fkw7CZo5DSJNTEffy2p
         Mscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785210459; x=1785815259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yo/lWxHJw9yNZPh3KLPiwdIL7Wsz2tn7HHED+a/H1h4=;
        b=bCtinpnu0Wyr54QqDNoRP1HewRgmimnqYaPtrN3PObrrqbKny25rSUyAatVPVjGpQ7
         KAF0tyShzRKd7g0N4zwSvyHcXTrHTL7rbmm10maQ7cJ3EfJ9xBEAYiv3F/MKNiiQMFXh
         5Ni/K6EJbp5AvYFSjlIAo4ICciGq/sC2IRrzeRFRDLlU1ieY7K9ui3Sel4tKveFRcocz
         5TrjzTqCWelg11kdjkom13V55fhhmc8V9W7vliR/aSfePqMpprq3oUcAvI3MULkG9wYN
         9IlHnHPztpq9ANLBceUvTL6qIerRQ8Jll+nie7gXtKzOwZj/wquBgXi4Oo7NWz01nTkf
         2TQA==
X-Forwarded-Encrypted: i=1; AHgh+RqyznsagBGL5Qud3IjKM4/WgFzQXlxG6ydmtp17ZKAiwd4XhyT/X9y1euTpDpaD4iRorI3tnEXWfjLsArTe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7qkCE6GfL1Yc6ZOj2ObwPTvH5LdLL4m4k7T11zeV39OZmOROO
	Agr81t723FnY8dF4qDPJ3TYMM3c/rQaeu5U+lb53SS9iTHNCT0bLb220JeUXUvZYTI+mDbX4cBM
	ZWMejbROYegp8sP02eMTlKLfoU0gTJJZmPJDvI5coBsJaaPOwBzcRJFvzg2O83UR5iCnO
X-Gm-Gg: AR+sD136yUus7WSsh9UqNt+JzqgPM3WpX0tmL4NcDlzRtxGN/0PD3jVczXRWwio5tBR
	ZY7Iam1EbSSnlHa0uyV/jlI1rKgALIRBllWWdLZExGRwCICL3HCeFkUXKE8ARBJyd1uoHN7FbWm
	m/mAfUs4ExOpLe7dNDlm9UCN20TxYo8gxbAYgg3uv7VP8nbmyPur7SIqTiS8/ZqQDUzeVST32l7
	i7T/wjznNdb5ccQcNm5JOCGpc4PGQB5g/fWFOzHMbXRHL+UE5/9hLEmlIsxvP8A07VA7DdOHwIm
	1MBqDXmGlVTFZDiTDBvDYiicw3bW486YbIhkunhDl82GuiwAdftKVw0f9F65lkfvAq2C8Fooh07
	9MkuCVqez2v1eaYMxutJqYiyWfMECJw==
X-Received: by 2002:a05:6a20:6f93:b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3c8aaf877a9mr932519637.16.1785210459491;
        Mon, 27 Jul 2026 20:47:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f93:b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3c8aaf877a9mr932490637.16.1785210459089;
        Mon, 27 Jul 2026 20:47:39 -0700 (PDT)
Received: from [10.204.78.209] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm37084511eec.26.2026.07.27.20.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 20:47:38 -0700 (PDT)
Message-ID: <3a83e00a-9e4c-4411-b554-1edb9d02c799@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:17:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: Ignore unsolicited DSP response sentinel
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260727130940.577721-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260727130940.577721-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMSBTYWx0ZWRfXwZKITHYfNOuE
 kcZkKU2CZutntO5Qt8nb98IW1Ch4ykg6cV6Vyd0IZ3vFZgUdof050MNXdPdtN2UwLc1+cjUEV0w
 8rMJuzZ28UMGBl5oSeGlT37+iOjgEUDlI0kBnM1PXXOAwPsyTUIu8uK1FSRfqcjIsnwiC2hI0tK
 bkD/sFRHdJolszFsDZENh0mIL8in7lRiLMnl5dwSy7R+15DaRW/gK+AWoydhDS1O6drr9eZvqq5
 j1QnX/6dpkzGj/JtZwXIVYQ4P0PDPwuGnQQuGxBRUQ0ztwXMwdsTWWUTBOimIJshTkVkiFVmbzp
 xCqYcD3A9QyMNETT3wRoUxEnDCF8ob0C4ys8MgkdGg6PV+tZF0+r/QG/paMMeZAw0/CUp/uInUs
 d6i6iXFI4t5w7zYiB6GLVkvP+lQZ6VbMI7kLrqj/iA0L147uhV2TSEgmVTOP0o2uxnlOhSsykFI
 ldW+FP7O0G3hU8MnfiA==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a68265c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RR3Qzd7dXdH_FvX10yoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: J2dmFFDrNP9NGEVXQTP2DtMeE_5VMzEB
X-Proofpoint-GUID: J2dmFFDrNP9NGEVXQTP2DtMeE_5VMzEB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMSBTYWx0ZWRfX8PL3GXnwRRog
 O+7Ec0puDUgFRPISPXXy3dZIYjGGyk3sM2VdkOlxqMWXxSviIwE3t+pRhb82cic4maQRJ7D3OXL
 TIphUAd3pXWk7Izgej2C2R6k7Y7kyW4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280031

On 27-07-2026 18:39, Shawn Guo wrote:
> The DSP firmware on Nord targets emits an unsolicited glink message
> during process teardown whose context field holds a fixed sentinel
> (0xABCDABCD) rather than the context of an outstanding invocation.
> fastrpc_rpmsg_callback() treats every inbound message as an invoke
> response, so the sentinel is masked and shifted like any real response
> ((0xABCDABCD & 0xFF0) >> 4 == 188) and looked up in the channel's
> context idr.
> 
> This is not merely cosmetic. In the common case idr slot 188 is empty,
> the lookup fails, and the driver only logs a spurious "No context ID
> matches response" error on every teardown. But the context idr is shared
> by every protection domain and the listener thread on the channel and is
> filled cyclically over [1, FASTRPC_CTX_MAX]. If slot 188 holds a live
> context when the sentinel arrives, the sentinel's return value is written
> into that unrelated in-flight invocation and it is completed early. That
> is a latent, timing-dependent bug that just does not happen to trigger in
> current test runs.
> 
> Drop the sentinel before it is ever turned into a context lookup.
> This removes both the log spam and the mis-completion race. A genuine
> response can never be masked: a real context is (idr_index << 4) | pd
> (at most 0xFF3) and can never equal the sentinel.
> 
> Lemans and other targets are unaffected: their DSP firmware does not send
> this message, so the new check never fires.
> 
Sharing more details for this context:

On newer firmware, there is a support for DSP PD notification where DSP
sends PD state notifications on certain states as per user request. PD
exit notification is always sent by DSP which is with context id
0xABCDABCD. As of today, DSP notification framework is not supported by
fastrpc lib or driver and it's safe to ignore this callback.

With this,

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..be9f102690f6 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -38,6 +38,15 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
> +
> +/*
> + * DSP firmware on some targets (e.g. the Nord remoteproc) sends an unsolicited
> + * message during process teardown that carries this sentinel in the context
> + * field instead of the context of an outstanding invocation. It is not a
> + * response, so it must be dropped rather than matched against the context idr.
> + */
> +#define FASTRPC_RSP_CTX_SENTINEL	0xABCDABCD
> +
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -2552,6 +2561,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (!cctx)
>  		return -ENODEV;
>  
> +	/*
> +	 * A sentinel context marks an unsolicited message from the DSP rather
> +	 * than a response to an outstanding invocation. Drop it: a real context
> +	 * is (idr_index << 4) | pd and can never collide with this value.
> +	 */
> +	if (rsp->ctx == FASTRPC_RSP_CTX_SENTINEL)
> +		return 0;
> +
>  	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);

