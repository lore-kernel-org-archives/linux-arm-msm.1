Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97052ED5A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867725; cv=none; b=JBueKX1YlTa8M23GvKIxYa5uYpHdJvcViiyFPgVyayX0L+UNH/3q2UVlHTMtpEnrYsFn/mWsNNXQMCPYsEq7SQTgue9xPvDj7HtBAL77IjkTI1R4/LiCGMY9+5vfcNebgGpyNBu9fg3ftiMFtI2JbXbNWfR2SmVtoGnvRcvcfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867725; c=relaxed/simple;
	bh=tSJmeU33PeyLzDvyBHs+j6Z663ewOVU8TXNb4ulkiYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8lhmyTxNfGDoCadmr+Eitp419101qL3T6lN18rrfb4WfaB/5WARZvX64H29MJGFsRmEUHzue+C+melzz/1LI02PW1ilRaNlAVd7oL28SzRU5ZyQtn7Fcar4Sh43Ft6yHleZ4WWqvUrn2Bp9HKKK2EWbaxxPcmUuH09jxsRoev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoqdOlb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DB4H5sey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoqdOlb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DB4H5sey"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688BYA0X2874441
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 11:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QV+zIsOLcXKbaqJsaB3LhZDmxFIlCQEKE/EB4eMCTJw=; b=EoqdOlb9tpch7yFZ
	C54PVTVRxYWr6u7w+vdXvC8ojefp2+j8mJzcDsiC9r6fuMOlxigg+RmplSK61RYG
	odtFe6n2VW3/XYnklcXRORQzI3apZzXTIoJ6/ZFvwzjc+vG0TUQtTg0yPDjabfz2
	MY+hFq2ymJlcg9irGqEGBLVXG5ra9vTpyzWAA8EMUN15bwhaJ3caOrYbYGRRNh6n
	BR1FhxO391BBbu3nwy7mlHRX3rZdPyxiybEWDjbQ17LJh97jx5WG2GrNDPIiLL3M
	t21+U7AhOLPigN2syXVFcNqbv8PcIRtVOor05s5JF5RQBrLxBVQbIrxB3XilZeFZ
	xOuy3g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj00x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 11:41:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7819910f8adso3911327137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788867714; x=1789472514; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QV+zIsOLcXKbaqJsaB3LhZDmxFIlCQEKE/EB4eMCTJw=;
        b=DB4H5seyiPzrm/KYONpWjVtcapmzrez3TWjJtXSgsuBzOx/MgHM11va8bc4J5Shjus
         lqIVlvOjPgiuB3joakI7Y05UGrUhN0NMUw7opKib1ZqpyaF3eASr1LS24I/EXhYfL87i
         FGi4oH5zZ3mpBba31ebGAe96KsuhE0oNgQ4xSR5dersIjKGS9j7wCpOqyhp0kFi+7iiV
         VdsoZTSv30furcEXzH6F4F7oKxCCVY461IfngIcrmrG7tbjMWqrN9sr5sgMfpilLBNaZ
         7sAYqLyy9s6dcXlNwpgBC0TtkWVvct0Ofae///XHjdxqhXe0ZcCbub6/Btl2Vp6v2XiE
         dGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867714; x=1789472514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QV+zIsOLcXKbaqJsaB3LhZDmxFIlCQEKE/EB4eMCTJw=;
        b=lqCvA/gE2bOU8x5eHIfaCetwxRITUl789gINe2eF+zZbJ4ZaLRqZEf8iAZXibYu3l4
         5VfYnA4jDgj/ZfOJn1cmtemLub64M1CKO0mejoLJD8+zK04cbzjBF4y+KwNC6wSOBj5s
         pvYf4U6n5XJk1kl9WgRUKU7964QlcFVMrB4l9gHBCM0LjsjK/H8sITX5h9BcTYvLVH2s
         XhGUclgoF9wo3TVnHSQ2ZxklEUm/GGV3y6qATewm+xolTx5cjU/a6X9udEFKvp7xYSnT
         R/BJ3RnHf/O89QclAirHr9wHP2n7xN3cXKTp6yCN+3oIf45ydVbfNAx+OqJbAZL7My2u
         k9bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYYXE3p0Z2bTwPJ26p0VvM8J7vcYoYhI44YM8SuL//O5f1w/auEnC9iiINhKLTlWmJPqK9cD6auV1gZ55j@vger.kernel.org
X-Gm-Message-State: AFuF++mq4Me2c/kjKSSTPciakC9atsygunxJzTVkyLS68EH/HeK17G3h
	cxMGjrGF2fmvL/BJY4OSUcm+XCheErTZR2DVpAMKIB8hb5MCuFPvCYCr/ymKcM/LwzwoE1eZUpZ
	byjrmqhdEbefR9mAl201ME4Tfn42YShUIm/5KGowCPjFQFoHVbMVIN1AJ8QxeJjXs8CuN
X-Gm-Gg: AYBFou2NJ5ZTDehnCxgdbNs9JkNfv6ALajc4c4Y47IjeYWs+WAOF6PKj/hblMQ2OXpS
	mPTSvsafCwxbptWydHUzXeE4K2msNGuEHhCuM8Jbd+c9yoJq9SASmokPrPy5oE62fIT3oMvtFiw
	owRLDlkv8rnmtN2DHAIrosh2QHgpl3TFhegaVJ1vRXBiloV4XlysjcImD3anVQWtYsSNyF97dnJ
	RWE52IlRxfCQ/svLIRjZ1cB73fSR+tTmIthNVN79arjaZLWtHQADziverSmwloJRiVQCBmMfCmV
	6hDqUMtSbomw5aJZ+RO4FsB2J1MfPxzvRW2k2ZDffVc4tvT3Fw9E8KynOqIQfLx74vw8K+wmbm5
	PeYEj0y2/WRJT1KtiAUcCUZ1Y9wqs9YKJ8qHsZpiuAmS2VVricq3z+xpyoCvIzKnxQVF91lK46S
	qNvl4kgrc+SQYD
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr11094441137.7.1788867714056;
        Tue, 08 Sep 2026 04:41:54 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr11094401137.7.1788867713514;
        Tue, 08 Sep 2026 04:41:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ecfbcsm3048299e87.13.2026.09.08.04.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:41:52 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:41:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
Message-ID: <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX9xlDRoLm3Qh+
 Hki8+t7ct7/EnTwl59GT0UWoJSeQWN/kFAnuANdNucy9LEcxgROUESPEBNPg8c+jhqtoxd1Da7k
 kZToskbfP9u7zyjAiSj92SLtPIPkPg8=
X-Proofpoint-GUID: vD0Phnriw6WgIcBE6SHTRMum7IVNCTwQ
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6a9ff483 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NK-yGmZRxCvKOhKFziUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: vD0Phnriw6WgIcBE6SHTRMum7IVNCTwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX8Ng9ZLbjv39U
 XQMGkWt7NvA86M/1Tfha2BRxi+MwxIfARAqw8qyi8ci/rVOaath5kyfc+R6AeuGA7zWIbuFayRY
 usAA+XvIbHebL5JAjZQGTefhvhLmtEH+jy1x44PWVhKtKG7Klh+CB9j9Ybz92wvt+f5HJ1p/1Hd
 /6REzZ8mAeFDJlEPte8t2yaPpgELzs8Pux/6PAjNkMo/13lH1TlvfPcyrxZZBGNFIOEMMLeYOfX
 UGhlaWxlj0hXiWsuefWrtXfCQGN8ItdIxwTx/Wg4jts3K2pmdkf2BSBeHYNezgynGiBrEeNesIR
 THAcAWEKXtQyxLjB84eUry10/5+ecpeN7Z/Yx1dlK4l7a/SfXNrrPodsptDx7nS+U1k/4YBtXLj
 l6Rw/jjL1+wcSpXre7+q0lZoI2ySZ9LH67lqdl4QxHAogzbIXfVftqYUFvON9DkGnmbxGEblIkp
 5FDgmMUsOngUHc0/xFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080125

On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> On Thu, Aug 27, 2026 at 9:07 PM Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Thu, Aug 27, 2026 at 7:13 PM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > > zero whenever the GPU is powered up again and the timestamp reported to
> > > userspace jumps backwards. On an a702 six reads three seconds apart all
> > > land in the 500..1200 tick range, stepping backwards twice, and on an
> > > a530 the OpenCL device timer conformance test fails because
> > > clGetDeviceAndHostTimer() returns an end time below the start time.
> > >
> > > Save the counter in the suspend path of the affected generations, while
> > > the GPU is still powered, and add the accumulated ticks to the value
> > > reported to userspace.
> >
> > This is useless because the entire point of clGetDeviceAndHostTimer()
> > (and the similar thing in Vulkan) is to match what the GPU itself
> > returns, and now you've broken that by adding an offset.
> 
> Just to clarify, the timestamp needs to match what UMD reads directly
> from hw in various different ways (timestamp queries, shader_clock,
> etc)..
> 
> If we can _restore_ the value (ie. write the hw reg) on resume, that
> would be ok.. but it doesn't look possible.

Yes, a quick check shows that all relevant registers are write-ignore.

> Otherwise I guess we need
> some scheme where an offset value is stored in memory somewhere, and
> some coordination with userspace to add the offset in various
> different paths.  But the kernel shouldn't be adding the offset to
> what it returns to userspace itself.

Ack, thanks for the explanation. I tried to match what kgsl was doing.
It reads the GPU timers directly from the GPU, but for the CPU timers it
reads the value from KGSL driver which accumulates the offset.

If I understand you correctly, we need to export the offset to the
userspace via some extra page (like vdso) and let Mesa read it. Correct?

-- 
With best wishes
Dmitry
