Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586104;
	b=ayGSbKdPqVLeZ8VG4vIRLMwkU8nFp4Zx2EERFNmI2Na/j/jJHGQUkKIDD7PI0UbcaeJ+
	 /Pwu5YQAzDksMh3zFuEXxwfoytbukPoW9kuOdsST0ZHhuyqI5NqM8I3Dl5AbchTXa84QM
	 MVSDcnq7MZQDIuTYyRTbUpX3u2YmEAPO+20f/yY+SRZ4mYDCdpJ1N2q9w7LD66Gu5ePSY
	 h0UHHzdO4Pa1ZD7i9vtWDtneAXi3lJfE3lqiI2+alRKzNaFJiXlZl6hbnhlPc905kvdcT
	 j1tCxp8pl7hmYJ1vFzV5jRZfLovn2Zkh4mdiyqioof1kqiVMbRmfAKGYhKkHjHcn3rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y+rsuhJqtWNNFanhIkLAf7k45qEZkJKqZ1V0TJOALXQ=;
	b=CxnJFMQfMZh4zt5Qi//bEs1EeGDrQJL3gDMlaG9vQ2uKOCzsW6OkGX8k6zBRepml4QI8
	 CUgGYyNw5yTx6KCSEaZg5SSJabgqEaksJMVfrWou2cm25ZQtQQ/gS1sIrAFVE94a5pEzK
	 HCMcqINNAeqb9rsV+xEKerhZy03Sd5XM+1JSLSbKJpv17lubQszsoa5pYPXagQx0b1yHE
	 3R8+xlBrAXOMwsZlp5lLAqjs3UpQ/rnxeqMgOKPOh0MetmEetkNkQhyR9XJ1HEqzA9TdD
	 ceEir7Xq1tnzGqehZ8CU535zWtNFrVH+c5mctLcSV9GX5YgojgRu/QN/yRdZ3gG3SMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMPrW8RW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFpiBG1T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A53606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 02:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A53606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMPrW8RW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFpiBG1T
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20KEH73264242
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 02:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y+rsuhJqtWNNFanhIkLAf7k4
	5qEZkJKqZ1V0TJOALXQ=; b=FMPrW8RWELU0HFKXBk2353xfIqmZ/ZI9edbKVvRO
	MrteUR5KPMlKBgAnVWj1gGyXgFubJDfsoNkaXFV69AxHRAnCpsWeJzEmBun9s0gw
	mULiMBBCZ1D4j0zdtHzHP6I7iubBWGBsZheJm7h73zIqShXQykbOH1w0D2rBs0Yp
	wPbCWP6k+b06/6pOahUllCVSXhdNoL+D6eph+J31xp9E04tiZMt7am0SbiCJDmJG
	DQv3z5wb0a6gWecv7q6CkRVajLgzRUUUWqsSDSVE9/08nqerzF9WcEDytItGXW+O
	PfSbfA9J74TZADvM7zAjbrw53Ezuw+F7BeiNr9Yl+sflnw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fw3dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:21:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6064055eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 18:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586101; x=1794190901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+rsuhJqtWNNFanhIkLAf7k45qEZkJKqZ1V0TJOALXQ=;
        b=TFpiBG1TgZeY+o70O+Lj+ljKzc/oroK3UnDMOy7x7Z1DJzjObTvwxa3Ri4U2vuW2vE
         z0qZ8Eg6gnu+Iy+YK5ccgiRGrdi8akfTzra/lGWhBW1DZTdLojZOEa5bVA7em2wvq/vs
         SZXh8RITuTz8x3P8BnzSq7uBrq0Jn1P635gkQ3doRcs7sJgZwX9r5G4IUsCQSSJkjD8b
         QDT8Uq+6FGBC1pv008jAN5wPS7/n+ttQqaK99Qn9IOGzU/7fRXq6GBtF8PzScJxZV39k
         Bcp1fCPbLMFA+lVcVwbw6D8PmAQEJFV//qOw+9//sNcN2xjHdY/Hfnp9Io5Fp6Q1/8XF
         h59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586101; x=1794190901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+rsuhJqtWNNFanhIkLAf7k45qEZkJKqZ1V0TJOALXQ=;
        b=XhtMSA7eUspe0HVznJlw9c2HHYULmNMIw4dWU44Y7WEnjYK2pYe2Ftgf4c7U7/podD
         SKCRZ0e0Q6taZR05LW5ajlYKp1QGP8mH0554Anm78aobAoCXdMYV8oV2wXm6k/R5pMkL
         TWi4NQiFi9NAaNJ10B8+DwCQIu2tUFQMc9N1tEHqziCA7GVYKqYn2DO4p+yD4r8W1NaP
         PeitkOvrrVy03BcZdz1dGLjzV0GIRpS3hJzrPEg3dejJrpsh24707RXVOmXEPGQGoZ53
         0PllKmQ3aOhlJvs6RBLP9NDhVTB43ldzr1+bIMdc1VMM2ZtrXZoargYHjGVur37YHIK3
         5YIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR02NWGWTFxZ1oIiVPIMGHjk/969O4KilqdCdoPUCxfZPb7+D8l8zgG+S3pp4azf+Ibx0efBQ2jOsYNuG5@vger.kernel.org
X-Gm-Message-State: AFq9FYJtWHKgyd1dWZsXJt4ou7YdsrtnCl8pHn99WKKn2+yYFMaNd7pB
	fxBSAwOgrvaCxJewspqxHTUYfHix5JmnrqeV6H7sopIW2KuyIq91Y5r6sRr5TQXAr1s3kPTOz/4
	CQ7URerW2aH61+wJik6R1Oosddt3YGkaMOtK5vs053q805GYM7g+aBOWMed6hA9zzvCS/
X-Gm-Gg: AYBFou0Z6t7iIiIQ/ZO9YGdkRvPCD6KZabqc/I9uNDYGrZCZplz+5Drmqv8UjmaZXoQ
	TVzgB5UUouT7IANkfPdJ1ixQUpvVlFCmS1B9g8O/9AyUsX5rGcXslP6qK8sZJI9r5IMEAYMGKwa
	dqE7FjabPoKOMSQOOD+Q82HEmmEpqt8APoBZXLnPbqRCq2IhNNtoC8TA1614LrhJ4jUFKfIYpmN
	/cNtrhAXNhgnOiiC+Re9joi81xKVK16DHjhnhdyBy7vfSJzbdXim5o61h1SknM8JkmmNFUBZMz1
	BmvXsmzDnuanbjKvBOjjsPPfMiT/FagI3Hk/342rMU/Q6iyp8IZoIohOQlhWXO8rfJtcSsAye3V
	zh4RvVzX7+Ly4n/ZHB0DCFHAID+VT9XvVmiXE0igDhV7OWXbdschCNLEDSmLMnQ4qCBUpI924Hk
	+pfhmFYVRTK/SRvfq26KVL
X-Received: by 2002:a05:693c:87cd:20b0:36a:32de:a239 with SMTP id 5a478bee46e88-36a420643f1mr13530070eec.0.1793586101463;
        Sun, 01 Nov 2026 18:21:41 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:20b0:36a:32de:a239 with SMTP id 5a478bee46e88-36a420643f1mr13530038eec.0.1793586100838;
        Sun, 01 Nov 2026 18:21:40 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm35620903eec.29.2026.11.01.18.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:21:40 -0800 (PST)
Date: Sun, 1 Nov 2026 18:21:38 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
Message-ID: <aufzsuS-hX5HTgLQ@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
 <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfXxcJIgX6qFHGI
 Ldj0yATevvs+flwrKagw5PLSwrM15ZLVbQiy2kUmdJWbBaeZ+22PlGLjJ2XqCrik6GTq1SLgZSe
 R7zUsqPPijO1MujA/4xe05AevbGXmLI=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae7f3b6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6HtGa1ZIcL902LZL58sA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: HK-32UHFTd6r7Ali4du-ITpPaTpdF0CF
X-Proofpoint-ORIG-GUID: HK-32UHFTd6r7Ali4du-ITpPaTpdF0CF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX9mWHyDiQ82ld
 EYVb4Tw5dLgsz4gXxbQaZ8azLPbdlur2M4x8BhuVmvfH38pxv7ahdoGozLr1A2ps7zPCWyk3ZOz
 t7AHKRGPoY1dvIWFx/IIOD53qQDO+cd/gyTYQ8KwZhKUm2AKUWwF2MaFHEu94gMcdqraaItQY+k
 T+kdRGcVOJGqDs8zhaUF8iaxNrjQe6G/5rYHFTvuQ6YvMWRBBFARUKFlrs3NlrHJBBuBsbNY7CJ
 P/Q/hVc3up5DIixDj6HM2gnkwIb48iCJwUf+gX7MluwLNH++dK3B/6cWqkuYNTnQ5P/nc7/8+3E
 snx3fwjcpVoGzxcu1+JNv31wDZZHclG7lij1XVQ4hP1BW0PlLWJobxgveQYdS+Aicje4sJxWXni
 XyOTxQgGA7ABbz5zgiA8ncjO9uJYz4AYcme+uWKMzQSIkQ9agafeerXFwSLeXewQfRIYQt91p9p
 mYS1k5a2nxOmESGlg0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On 26-10-30 16:54:55, Faisal Hassan wrote:
> On 30-10-2026 02:54 pm, Peter Chen wrote:
> > On 26-10-29 00:29:31, Faisal Hassan wrote:
> > > dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> > > clocks. If clk_bulk_prepare_enable() fails, it returns with them
> > > disabled.
> > 
> > What's the relationship between clk_bulk_prepare_enable() fails and this patch?
> > 
> Hi Peter,
> 
> The wakeup interrupts were disarmed before the clock enable. If that
> failed, is_suspended stayed set, the next suspend returned early, and
> the next resume disarmed them again. disable_irq_nosync() and
> disable_irq_wake() nest, so each failed resume left the disable depth
> one level deeper. This is the rarer case, so I will reword the commit
> message to lead with the runtime suspend case below.
> 

Okay, so here you may need another patch for error handling improvement.

> > >   }
> > >   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> > > @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> > >   	if (!qcom->is_suspended)
> > >   		return 0;
> > > -	if (dwc3_qcom_is_host(qcom) && wakeup)
> > > -		dwc3_qcom_disable_interrupts(qcom);
> > > +	/*
> > > +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
> > > +	 * even if wakeup is now disabled,
> > 
> > How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
> > hardware default value makes it enabled? If it is, we need to disable all
> > wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.
> > 
> > Peter
> > 
> 
> They are not. They are requested with IRQF_NO_AUTOEN, so they stay
> disabled until the first suspend and nothing needs disabling at probe.
> The issue is that runtime suspend always calls
> dwc3_qcom_suspend(qcom, true), which arms them in host mode regardless
> of device_may_wakeup(). The old resume only disarmed them when wakeup
> was enabled, so a system resume with device wakeup disabled left them
> armed.

Get it.

At your second patch, it already knows the context between runtime
and system suspend, you could disable wakeup enable if the device_may_wakeup
return false, that could avoid introducing more judgements, and have this
patch after your 2nd patch.

> The comment read as if the interrupts trigger while disabled,
> so I will reword it as:
> 
>     /*
>      * Runtime suspend arms the wakeup interrupts regardless of the
>      * device wakeup setting, so always disarm them here. On failure
>      * they stay disarmed, as a level-triggered wakeup line could
>      * otherwise keep firing while the controller can't be resumed.
>      */
> 
> I will update the subject and commit message for v5 to cover this case.

-- 

Thanks,
Peter Chen
