Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020723;
	b=qPqGPutv9DNVg2UYaHEaDwJzl+FZknDt/bj0ROgzJBPr1bpZFnSD2j8J8yxT10mWV/qo
	 yj2p5G7DDzPZc/hfwbwwZKZLnoI/jy97ItbYA1H+bPtXhX8H+dGoxgVjpgnjMb5T29c/+
	 8nnkfPpzxkiTs63YembzUcWF92TIPtabJIt+A0WMUJ0ZEUobN9qGUt2nYHOMvEhEvaXkD
	 mkVd0pbbQ4KSN8LmoFvrvdSARatEgx5JB1WZut9FLrLJ6d3PH+yl0lBttXYIOPR2hNbw8
	 F5Ecyb4BISTh9Ea2+AwvBEFDUdpQCiTguFDerTlNS1RyZJQyNfZSk5i2PovjkKi+SMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
	b=r99qgpuXJcgDVTLz1mPfYo/GbILJHnucGdUN8gcLPMbVX+6JYGJ3iIkF/IflJqFerKvP
	 O3gGmFhKHBOClk9Usgy2ECLEdOCs5pGkgVYhF0guC6roaGFd6AEFGR+tOnaDzF7J/xaB7
	 H+p/Ejt7UfQkEiMNtY1xaiMElYQw8xJp+Uj2gmLKGoNFF6/AjzDkZatJusm3RevZ6TcjX
	 I16EbZ+BErTlVvkkNlIacRDMMI80RHuHr3jF5yJ2oTUs9MpLrSzENTIMwhYBPj2XcVQmL
	 T9takuHcDq/N7D6RYx6zCh89KpXekA7WRL4343KX5Qw9Ozf7nRGgE1kLSPlVqJ4JhcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DZ/egG/G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZsPBHXn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C95060A2609
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C95060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DZ/egG/G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZsPBHXn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtPB13348728
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O6hrhU2TB9r
	VsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=; b=DZ/egG/GK+Mov6W6DChHfL9rtzr
	4vPzJgp9SN531V4cFO7s+I2kIkT+D5itugKjsdAbwwzIV3W2Q8WKiF5MrgX78sOI
	lAgHBXFIxW3R90xJl86q31M7DJhnHdvYNvGiHx0ee9WI7JbJX+a7LZkkgEjDOZno
	aiPRcqstWQhK7FyjCnAoeV60BDrFzoIn1Pbl1tl+fG2PYBwfJPZuuSNX9uvYEdOp
	bz2Gz2+WF80ZtM6T0SVW3QFqTlyKZMv9p5TTzxwHG+oHFEZtKpajKKJxYJHWDm4y
	kjpY7f/KbuNv3pIUmCxHsSNVqx4c8gEw1iqsyHRgM19m6NKlV9c0TNXsSGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xr32x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so391628285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020721; x=1793625521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
        b=TZsPBHXnXbzTwyrObCcMtxPdmqbKCDkN0mUZOwKBdOGTzorFBid62dueC8X+5dhKHV
         KCiX88tMM0nRRgfpWDzxlymN6yjjJYpF27y4esg00WI3y33nlA5h/O6pIqAqKnT/Jhly
         jnNaNlkd/SQv7bq+cXeIyJrjjT7SQ/1BgsDQYsRk8fKzPHN2BQA8AYflwgMuqNMf69SD
         SFLeIOrV2B4Slvj+1qpFE4v65JX3rkWG/MyBsjX7vm7aT516Tovs5yOnNA9Qez3Gvkut
         9Hj0nF/4HrrlopDNkajVvIAqOm/iVgtvRaRmI8AgjZL/HzkkVnmTSgBnzqw5Z0T6a8Z+
         Ah5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020721; x=1793625521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
        b=os0V7pAwFYB9LP4AVedHEvYvGdGcYf3a96PDXaPhWdYcej/lR4dZwf8qy2EMNZ2NJg
         NGCoRRFUHGrWGif/nkd2CzbZuw4eqq4zWRSEo2xAfLa6wjVPePvxnc9vq+YlLigeihdQ
         0BO1dWxXH1ncuAfd6s6AWwY0KN5eaixd3H9oVkFkOtenVurdjLz545rVFCGEw0sd62Mj
         zWRiyob6wu3p2Iehl5Nphm4j4eUjAm2MIc58G7/QzbQDW3O6GumuMUgZ1RCaLPAfpHty
         ro67haIrWfgFCuUv6muRb2DOL4BfLfOweDas2Dx3oNhqDDjInOLdRYBpjq8uKQFLU2Q/
         Xa0A==
X-Forwarded-Encrypted: i=1; AKwUvBxSHGh5iu0o4IdpWzueNVA96KQPbtgqB75czVRn4/4qhEVxn1VewmreImKE3ulMYoRWhFmIlEh+Z7f36V5M@vger.kernel.org
X-Gm-Message-State: AFq9FYIXT1qe7jpp7EpNV1P6wQlE4SpHnangAQSUSp846Qa+OZIJBGDO
	Hg5+yyx02n8hCbZt2ekewUN1ARdywqmnukUTXDi3aI+yi0ZaTWwKW4A4hbubfNh5m3aWltUXlgj
	XOy16XvYZjdy1qIcARtqyOS/spWajRLm6/J9IMQv+JiBsSafEr1Pfm3Oe2MwyO5KtTkRq
X-Gm-Gg: AYBFou1BiObMdEjuUvZZ4BrVp9FfIFykLIvGG8qBV7pLBs2y6qhFNXUJZsB5vGImsT3
	mCE9vSaN3GRgEvwVIK9nX8ae49/6KbyGiKJnzQwSPaABPaZlgWn9cP74VzIP+DSQIgRg59WvGDl
	Ocq9eh+/QQhF9nTCtYlzlXJ8cTIDhD9cIHLyzmeB2kEMHcawsc6v4QQZbUSu89uqCDG0IH46aq5
	j0x7aVB03XlZQEyT3kxoLFh0wKxUJSPrQfTdkY3CUS7jp2kDCZVBRdTZQRWRhOkDoict2RzU6xw
	Bruf1odhPPQNvAaKWg0QTxGtILl+ryBuxMAkFkRXdFrJcmSxnQdYZs3eeHcpJizSBeEyjzmhbzD
	ehbNwIP58Rt9fAwSPakO6YPUV
X-Received: by 2002:a05:620a:4589:b0:93e:5060:f929 with SMTP id af79cd13be357-940ef8ad22emr1013162385a.19.1793020720906;
        Mon, 26 Oct 2026 06:18:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:93e:5060:f929 with SMTP id af79cd13be357-940ef8ad22emr1013155285a.19.1793020720353;
        Mon, 26 Oct 2026 06:18:40 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:39 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Mon, 26 Oct 2026 15:18:33 +0200
Message-Id: <20261026131834.3247963-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f8173d20-3193-45e6-bf27-a05de7187ae7@kernel.org>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com> <f8173d20-3193-45e6-bf27-a05de7187ae7@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -Ox_i7UQywTWMe37BFQF90e5gPvsNLC6
X-Proofpoint-GUID: -Ox_i7UQywTWMe37BFQF90e5gPvsNLC6
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf5331 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=wnPfnd104F1z6JJcfBcA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXzuxR+jAmyYLx
 BdNmso2MrVfUnuHbulwZYhMkLKO6rGGqtqYWJWnFwhpqh3Z+H+BD9RVUdgUmDPnZfryl+JTIzgN
 FVMwFDzXgJrkp4f/qzJrCgPVXwhYpqZOHTuePe9paU4CxEpZj6NbrKCau5AXsoxsFHH6ltwLFPF
 BesB5F6Aw9sb3QuzHW9YCF9k70lgMh3rL4UdZLusuJwSg/QaIplES0+KPJjuu+cvpmwHg3KqbnB
 yWcRXCXR/4O7aiWkrIHzovP40gdOlGYsnsU/nbRc2AxCY1b1eid1zkW6lRNwczyGPhprNu3gTpD
 RpScLHebk/lhGT6eatXlRnGfH+JV3qhma1Ze+itsmFBCYD6/OiwucBAn6CqTCjVLPc5d4wcA5cn
 kvyd0kEapYpD+aaItNwfgS+mTK4TdkZ3No1bbxUA92z3/HlaAnFIJWc8/IRsFa3zdfqOV6BOuuB
 ODd+lPEyZXiL4Xj6wvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX8cIPB983i47k
 aVs4AFnvpjOGA4au3K2mkOQN181SxHPR+aB5U3sr3tF91PHnHV8w2yrVR2x+84JCkmQI6tV2fwE
 1cq7ajiYKUQT0JOArgXibDkTaZN1ysw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:22, Bryan O'Donoghue wrote:
> Why is 100MHz a problem and if it is, why not just fix to 400MHz ?

100 MHz is not a problem by itself, and I see no failure from it.

With the rate ranges from 4/6, VFE0 at the CSID test pattern sets the
fast AHB source to 400 MHz; starting a sensor stream on VFE1 then sets
it to 100 MHz under the running VFE0, as the two AREG clocks are
separate clocks and their floors are not aggregated. All frames are
still captured.

v3 will list a single 400 MHz rate for the VFE AREG clocks, so neither
VFE lowers the source under the other.

Regards,
Atanas
