Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560353;
	b=tcHF/S/TA+s30j8CeXb3UGAU/QUPATc6BetdhryMirWgcH6VsuojLzsgoKP08+s0Z38X
	 Q0k8CpMYHHYu+icbZInqzBabDMnbkXXdxA+6n8KkILv7SPG84UlVv1MoDs7vCKEPHy4+1
	 btC1KNJpIx57lqOwODIxndoS47obU8hRD7NjjBaEOSwzXF+NvinW0/Qx4PjOkuUda1Brz
	 Nc9ijQquerCU9RZZ8FCVInBxhXxFpwUE5kOdaHZfoijk133xLiLGsOfHjN9Op8+7T9cWs
	 jIYabvmIryvjGC3sAlStHaoyluozVkgYVVKQFCbFYAKMykzzbPlV2ZAk5vmu+P3zHkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
	b=Uok4EmnPic/ReArmbLtceeqxPaj6789rVgcvTX/0Yn/UCu7bJIcz5zygxPBFAEcZObMc
	 mwsMvM584o36x4Ey8RHnVgiBjLRf0TSMLa1STkxAXTyPUN8mJ3jo9O8kVXH3AT5CvCzz/
	 4vMglU396hX4newTG06+iSLN0AKKntoEFOQyAu6NkyUn1IaC6PyFv7q6qMTzq/uyh61Pl
	 rmRE0qevFf0yaYPQZx0Zwkzg+9f+QtogqsHwqXlaBdDH0LhkqbAOZVzS3Gbya42bxixeu
	 kM46kJ/49sz7V+6EcYu687l6IWxO6n/I9qzYk0hFJud+kSodCeQtMqhTFRTzl98rqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0QAN3oS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XigveMC1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AF5606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43AF5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0QAN3oS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XigveMC1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V9Uv2182005
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaCKuWoch5k2Kjk0XZXFM0Ps
	5nVvPhDt20xb/z6BgX0=; b=F0QAN3oSkmjXryB+McqTbr0iaQSPYlX2D23jMe7h
	tH3o7lIq0mdVAPS+NNwkMN/su6sThmzr5sTC6xO9v7mkZyvnbXjnxvw9stqfpXcu
	WX4z5RJ5SGXcBNzRjGxmp0W1VsWwkmDBOxKfLXPQ0TvbWSdmdMBxrXS5a5OvVClV
	m7R7GRaNqMoybnGaLWBKUlTU7aNy7HdZcr+xdL5tSAFNF0aNjCZxUDFtX2IDTEAi
	0bKR0qlla5OEvln95ah2olXoL9ZIPNnFq8By72s0o1qbkSNbIssU6OyCnUZ3GIqO
	z+pk7uXuVDRoBN+peJP481m6eCkso7A2PyYW5L4Z4faLpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rm21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:59:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1196779eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560351; x=1795165151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=XigveMC1mB/JMtopPn2L2kU7j3cmr7lb+/DifdyfusGrHNtu2qG6E9KtbIsX4mGymh
         AJ2J9MyLhXtZsDlmKP9Zls2uwJ11qslWEXQNBXxPrN5fHot0PQQHTTAbSgRYgElWOOV7
         ykp1TUPA/JPXrpj+kxchnQnK5XU+45jpeJtRyaK/2XbdSw9KI0U5wPXniuoNy5AuMPAW
         JvAHTzhsnzUa9Je7V/bnh0+PYbn4P2UaZzlNxe8pJdDVCQ4Ah8WvhDOKkz9vl0tECeQz
         PmQVEVBuTrHaELn/MF7lmSlNY+lFwDN/TpB0YpFA6cLmIHombQ4kllChxCjdmjyH9vDs
         IQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560351; x=1795165151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=EKDx8PnnUriSQ2EIIFyzCvuQbMaUc6xBohvNVSxbV0XVNQ13LCXiHSH3N/f9JxeXN/
         2KmHkrOVXALWjRXW8YYey2RQyK0b+IDgE2rUyen3KWyVm3pZ11fVxTJr7+oHoVVYlGQG
         WSNkKF6wUrdtJhXQZ1qvMpEvvPWBc/QCuzvMTQmsYo1aVM0Yn5HKzs/855VKh6n3c9MU
         lQqTmdU4jL8qfR5M5mpR5227BUZYsjS7EzRggf1BhhtJzucc5blicE3KkFPzuC046HUU
         g73NNFj6aQoZishQze6bE/IGz2nSbvgtWc07xk1NOQjEBS58G7vI8WxnIutcKQWp1nkB
         Ky/w==
X-Forwarded-Encrypted: i=1; AL+hErGTvn1PwSTDMa5muYOg5qtwtSYfkP5S5QTJEDOO4ExhfXhwSxYvX7JNhEpj/hXa2XiWyzEt7vSJUA3M8erC@vger.kernel.org
X-Gm-Message-State: APuU4Z90z7mCG1mjpD3Q2YA3vSzTAUg5HR+3nXLSH9FV/BYXUwT+Nbpx
	zmtGN70GvZJg7n8nwwa94Vh9rHujOihDz0CMBfg8xzBSw8v0COQxKGKAevTRLFbaehBrO69hmfO
	/3FNHPeGiZ2Vt4bK1UGpqoyLJr6RFig26DawYtjTjsXw4wCh5kjiJvZ1tdukYm6FdpRU4
X-Gm-Gg: AYBFou0ntAMVNyRjpLysCZ1FvkP04Q23Ge04p/pWLqsK8LiO0v0r27mx3fWBC59+W5M
	oul0ZllCdBTwbFnjbptH0JxeEF0rfXE0QjwN9lKLanomXZPIuQZTOVeFBaayts3eJ0NjbJvGUJI
	64rGZD/W3UdcXjwiRJ2N+x14hf2n8d4nSFpL1lkqxfpEH9+x+kewanDZ1c9G+sso7D06jksgedz
	M8amigqwj3Tr+k8J5tS5Y6kGub9DiEDmEtJ+aGcpjJkDhhN4OP8wBUxEc73r9FDzleojVPoOyT7
	vkiBqfBzVghmsU5BKAnk3Hdd2PewBp5jkEPiYWMypRXZHrLSzFMK0aRH4Rg2IdTV0D5HDTSWWGH
	Mq4cbnymT2K5e+SVzJ27vcJnL0oBFFD0lpnzd8cDldxeebPu/tFRCZBSS4IhpwsCwpGjDMlo+QS
	s=
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933671c88.3.1794560350787;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933628c88.3.1794560350098;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm8926890c88.3.2026.11.13.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:59:09 -0800 (PST)
Date: Fri, 13 Nov 2026 14:28:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alex Elder <elder@ieee.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 5/8] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113085856.mpa2zi4argm2e6y3@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
 <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
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
In-Reply-To: <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX69mN9P1Ka7Xm
 kM0acUDaPfQej9OG3qwSlL3puqZMKBVrOqS5qPFrC/s2yXm31+9qAzWPrxqN/LSQDDWGcgWgOYE
 4tb/JpR59kOM9pdDK8Q3LSgaBOIEHouMzSfQbhy/aHMmiyB0OK2UuZyzzdppI7LnFse8FCQZlB7
 C8TZNioMLVnwSIRqVYJ0KLvJ8Md3xjNmnJAncTq4MnKgOPXy8x5JVr5iTl6mn8HQo5n9TSIca/8
 Hx9sQojuc4vLDBK5vvdSkkaDCo9uQ8vlaHpF+aXQvX9v90U9zrjv+I5LYXsopsxqGGlr3MeCwVk
 OKuftdTM3z7OBa9llLyhouYIQMIrQOblc6ZFFNxWP670HAOHoxXJ6s3ThpVhjwZ6NMwtVeR++a0
 uJv5Owi4m9Po4aTSchsKn0MKywb90yUu/2fXK5nByNyn811dERWMpwpTjultbKRpgNhuaLeJ5CZ
 kCBTM2UvV8yXim01W1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX8vVEXYxJTbho
 ZMQ/SrMqOKGG5KiObTGX96PHQEuNx4nfm2hBmXU7QOjj/Jxv79c4a/EA9DkvKVBb9S70W51KIa6
 JLhGan7Vx2UjzL9WQC5OXI/p8tIJY/Q=
X-Proofpoint-GUID: 8UqV1Fmx4hf7PNm1n2hfnFnHmrL13NB_
X-Proofpoint-ORIG-GUID: 8UqV1Fmx4hf7PNm1n2hfnFnHmrL13NB_
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6d160 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=s4fcayaxKqd7nPnH_LgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

On Tue, Oct 27, 2026 at 07:49:03AM -0500, Alex Elder wrote:
> On 9/25/26 10:57 AM, Mukesh Ojha wrote:
> > ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
> > memory setup, and segment loading with no PAS context, then calls
> > qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
> > before TrustZone authentication.
> > 
> > Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
> > with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
> > the same context to qcom_pas_prepare_and_auth_reset().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> I think this does the right thing, however the IPA driver does
> not use resource-managed (devm) interfaces, and this would be
> a first.
> 
> Why does "qcom_pas.c" not offer an interface that can be used
> without devm_kzalloc()?  What if someone wanted to pass in a
> preallocated structure to be initialized with the (publicly
> defined) PAS context?
> 
> I was going to suggest that you just rework the code to use
> gotos and the cleanup path as used everywhere else in this
> driver, but it looks like that's not easy.
> 
> I'm willing to ack this but I would have preferred to preserve
> consistency.

Ok, let me fix this by introducing a new API to initialize the context,
which will only initialize and not allocate. This will also fix the leak
problem if the earlier API is called multiple times.

> 
> Reluctantly:
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> 
> 
> > ---
> >   drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
> >   1 file changed, 11 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> > index 14ac2d2faf7c..6964395caedd 100644
> > --- a/drivers/net/ipa/ipa_main.c
> > +++ b/drivers/net/ipa/ipa_main.c
> > @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
> >   static int ipa_firmware_load(struct device *dev)
> >   {
> > +	struct qcom_pas_context *ctx;
> >   	const struct firmware *fw;
> >   	struct resource res;
> >   	phys_addr_t phys;
> >   	const char *path;
> > -	ssize_t size;
> > -	void *virt;
> >   	int ret;
> >   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > @@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
> >   	}
> >   	phys = res.start;
> > -	size = (size_t)resource_size(&res);
> > -	virt = memremap(phys, size, MEMREMAP_WC);
> > -	if (!virt) {
> > -		dev_err(dev, "unable to remap firmware memory\n");
> > -		ret = -ENOMEM;
> > +	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
> > +					  resource_size(&res));
> > +	if (IS_ERR(ctx)) {
> > +		ret = PTR_ERR(ctx);
> >   		goto out_release_firmware;
> >   	}
> > -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> > +	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
> >   	if (ret) {
> >   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> > -	} else {
> > -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> > -		if (ret)
> > -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +		goto out_release_firmware;
> >   	}
> > -	memunmap(virt);
> > +	ret = qcom_pas_prepare_and_auth_reset(ctx);
> > +	if (ret)
> > +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +
> >   out_release_firmware:
> >   	release_firmware(fw);
> 

-- 
-Mukesh Ojha
