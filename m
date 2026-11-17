Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930590;
	b=wFAOKDwda+TxKrKjdd4e7QuWz5Sk/5GcJdzZoI3DPWleG2DHC2ELJHHD87BAG/i6rFHD
	 oHaed5oGN43K2Cb8fFCfwULOd/sR6i24TBoC8vXd4Ap6jsbD7jSCKfHp2peRWk0tgKp2Z
	 k3Wvf9TGWonv1yfRW7vmv6M8d5w9WdY91cJQch70tO7bAnTqbV0mBrk3PNEt26XFPyl9G
	 iR1SvfJ3K8/mEvKIovXDPOTgp9fwWqiXbHgef9jQO5FOpU84ZYJOAo/XSI1Uu/FECqMPg
	 +0nbtWktkNLut+OqIV48hoNLlKONjjocClV74igSKr702TfOoXTtngGVNKVnscLqRqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=;
	b=oGV8brAPdzBA2mNWVwXBuavXGYCXkNoXTzebHBy0DC5AGJWdjY1KJqdZ6tO88qaozdUc
	 bZXIDtMGcRLNuRdK7Q7sXGsVedaC/XyLn/IbluirCHq8ESRSYoM7FNVS7YeA/a54imkmA
	 n82mpxXUhKAUV5mrkambtu/kgikXDfv3/hZ7ETPf7YxfL7lRjaRdNKUdyLastVPBnVrr4
	 qtnNWU6x9CXZQQzomhxz7NMrHeCDG8fX8gmoOqNV3jnbpJvYuClI8L7cKOlEWb9UT9C4M
	 SNo/e37P9T7BhrbORkSb+92V5uy6DCVRaxs3sauRCcu64GiTBVsNqYucGLBfkF+yWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X4V6PHMA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EwwO/QYS";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1C606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A1C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X4V6PHMA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwwO/QYS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFRkiH464700
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=; b=X4V6PHMAt/ILcHjo
	1Vq3/EoGUwQ2eP6Xx81LWw7XpFRPuFdkCTB5BUy2tFUtX6le1KWZjWOlq/lu3Skz
	vhiiK33lWjl9zF0mLUKzidsWHSfbuaXOdcvriUWTMfqABaTdHieSDeIm4NLTkGUU
	24MKhgDb3GLiIgz3UyrvJoY13bxQfzAntNMd/RoEH1PS/Ipo/fLM78C/ZQTsApbi
	HQF5X0fNjcMuYWaPpfua728/WkRHGV5fyeppeLAq07IfSWico4aUlHkyHqgA1HWA
	YIyprekKOCKDNDvWlZ4WzwcV0sudgi0axkeBPkTvV3nxrb/0K1dOUiwHaVj9lTbW
	qVAX9w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0cauv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:49:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2840081a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930587; x=1795535387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=;
        b=EwwO/QYSxn9kXpjw/2MOWuKOpSOfGhsxbmQ8KLKreW4pHx14cKGphVBA6xzVWSFLNw
         jpsW+0HAU11FovLvf3esm8As39hS1m1ofVV/RW4Jli+P28XYr2dfBJdHa25r/wedN8Xc
         LuSwbZ/K5kDPNXwVUs3PTijVLFMSpe9oF7z382dJIdA0wTtjl4KC9SViiM0bIPyoVfPF
         pMB3VFf98xnOHIdTkdctbNi1JEMSvrqWwnKL7rJqjnKn5jnt2IpNs0W2LT8JQtwHEmV4
         yb3gZQH/OGPD2/vEuNWLyWBPHy5NyVSJBOlnz5snmls1r7pcTiX3sbwkb76HeZMkk0BF
         I7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930587; x=1795535387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=;
        b=ATDpdoWwnLV/T4F8+0qjlYFINq6Uk1ILgm0HfCwEIPHmdtAFJ0hAI15nG8NeBsh2EQ
         TaG3hwYUe1Pd7nc7ZAeIRJyw9fF0OoKn4AdX7Nn9FjRyrGoQNJJ5SK+NRPOyvEtGUXeY
         p+Fxsp4tTvj50sskh8wP/9G19Hi7dSW10goVAQIREvvDTPZGzp+6Yy8GKNOBR7KJDgHq
         qnSFU5+AY3ydDbiiJUIEKlNuaxTScFKE1qluYQBo8q/SJMMsANdWuTDjg9sLvREZ7SMQ
         oh/IzLMSA2XA2Wy8nmiPGKcBFSjCVZtDb1HiFK5N6075k2qfMQrwKWhJ6Y/O+3McemCt
         uKAw==
X-Gm-Message-State: APuU4Z+Mpaz4doJ3Zj0HRTfGK11aHMYYSVZLI0USNnt6U7FDuS4LY2Ke
	fNxs9HoUiGL2d0VD2mi5rvlWqGObEDfxstbl4iZT0tC5GlnbArlRDNL1c9J6W0PXKy7puirur//
	6jZX5Llsvh5pMDk94fWW00ltidcQu0vr52zqVL6Ks/AWfcdtPcw/qdX9FBNqR8EhTFxFm
X-Gm-Gg: AYBFou2G1YgdMDAI3YvZ411syqgW51e9eYKl/oyxJJldn2+x7h9k5VcM256/pwkLzN1
	auTc0kOl1mTLZNtXwU/Q3gP5JZJMeYwgKwaSavlykuefsGEojY7O5Kw5CuGZYvaVovvBm2sQwo2
	yHv4fo+fSveHU7je0WUPww4KUpwfwL+kMzBxFtt5TCOpQ2owP1eOa/RvIDGccQL+BDJg9/uG1o+
	vcfm/arb6joQqku56cN+p9wu+52GvjIXHmA2R+sZKbIZABgC33McJNOVmUDJVd93fIxGL01lq0W
	Qe0rCwMToq01XGPGqjAO78JhDhJUw3pjadmfh+g6cFdhXMYeGoRLmxezTuxmCVu3aqAH5v+HQHd
	gbx3ausYEFdTi0f4B660YUQROmdm/jbJOn/wMQqp+3cXxHf7FQenjAFHiCt965mvpmvoGdZD6Bc
	tfVg==
X-Received: by 2002:a05:6a20:431b:b0:3f8:f792:2373 with SMTP id adf61e73a8af0-3f8f79235f0mr12126561637.48.1794930586610;
        Tue, 17 Nov 2026 07:49:46 -0800 (PST)
X-Received: by 2002:a05:6a20:431b:b0:3f8:f792:2373 with SMTP id adf61e73a8af0-3f8f79235f0mr12126525637.48.1794930586048;
        Tue, 17 Nov 2026 07:49:46 -0800 (PST)
Received: from [172.20.15.99] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90f1sm5515688b3a.19.2026.11.17.07.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:49:45 -0800 (PST)
Message-ID: <d38594cf-5359-4862-9e47-81e15ab8fd05@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 21:19:31 +0530
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
Subject: Re: [PATCH v4 2/3] misc: fastrpc: drop the DSP-response reference on
 channel removal
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
References: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
 <20261117-interrupted-invoke-v4-v4-2-2320a8a7eda2@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261117-interrupted-invoke-v4-v4-2-2320a8a7eda2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfX0UvTXPeWzeg3
 LPlUTZfweT0d49HU80vf9/sl+oHbniMJlWqu31LqcdVFToxHL+AD0L6S2BOcHx7X8b2JWSnu6MW
 pM/PcQs9i4lDTfYTma6it2jXkSjDyBw=
X-Proofpoint-GUID: zmh6hJi5ia2BPG3ngKxvWTN8aV2j_o5G
X-Proofpoint-ORIG-GUID: zmh6hJi5ia2BPG3ngKxvWTN8aV2j_o5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfX0UifFIQu8oIQ
 aIK2gFbeNV0ndwW9oiuBfWjfFoUW60v9UM3U9LvOmn2XnDtf0WLgZtx1u6B3gRyTDzc2TGXkFbK
 qhO3xo46bDFII7nyKfgg59PA8QEg8nrpJxKTCjciZDEEyG/xS5oFw2zvU8tvvn/n6wH61GN6z7l
 rw7kK5dP8G1n6+ckqPkAiBad8mBUhdcj6lbPxftAOs+ceT4S9XHZ2Ysu4aV4flEC07d0NAroPrv
 FQBViffz7g0PrgEfZ87dmQE7DTvSfTwScDoq52X4d5zLM32nysrmJAq3wJRfSdH74qJlzb0qR+D
 f9mVkOvmmyiaERSwX8CAFmtT7lvPJkUR/dxeG9WIfD5i96N06gwOq5Eobgx6ZYxAvbhQuAZ4S4D
 c67vUsqcyePreHc/eeBejt4X29eYHA==
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc779d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1jytM14GPKulnBB8BfYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611170062

On 17-11-2026 15:09, Anandu Krishnan E wrote:
> fastrpc_invoke_send() takes a second reference on the invoke context
> before calling rpmsg_send(), to be dropped later by whichever side
> consumes the eventual DSP response: fastrpc_rpmsg_callback() for a
> real reply, via schedule_work(&ctx->put_work).
> 
> fastrpc_notify_users(), called from fastrpc_rpmsg_remove() when the
> rpmsg channel goes away (e.g. on subsystem restart), only completes
> each pending context with -EPIPE so its waiter can return - it never
> schedules the matching put. Since the channel is gone, no response
> will ever arrive to trigger it through the normal callback path
> either. Every context that was genuinely in flight (successfully
> sent, not yet answered) at the time of an SSR therefore leaks that
> second reference, and with it the context, its DMA maps, and the
> reference it holds on fl and cctx.
> 
> Schedule the same put_work that a real response would have
> triggered, exactly as fastrpc_rpmsg_callback() does. rpmsg guarantees
> .callback and .remove are mutually exclusive for a given device, so
> there is no concurrent real response that could race with this.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index bb0c304196..c5c3679f87 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2835,6 +2835,13 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
>  	list_for_each_entry(ctx, &user->pending, node) {
>  		ctx->retval = -EPIPE;
>  		complete(&ctx->work);
> +		/*
> +		 * fastrpc_invoke_send() took a second reference for the
> +		 * DSP response that will now never arrive since the
> +		 * channel is gone; schedule the matching put the same
> +		 * way a real response would via fastrpc_rpmsg_callback().
> +		 */
> +		schedule_work(&ctx->put_work);
Can you check the sashiko comment?

https://lore.kernel.org/all/sashiko-outbox-218551@kernel.org/

>  	}
>  	spin_unlock(&user->lock);
>  }
> 

