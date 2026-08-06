Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56DB44D01F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014860; cv=none; b=hIWvdFXWP5EkdEx/sSGZI0F+kfM9ZbRQmax0fWO3EkXXB7eKAGNN/uH39eAO2keXAXE0DiCbgxKLVEkmcwTNQYGvpQD2d17NSv4x5WL7iUvyEJwB4VFyDHZw8mmCROsXIXdhYRx6o8OLgnOk85f2QgojMVbYHcV3aLXsXxpS96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014860; c=relaxed/simple;
	bh=j7XXgsxDLgXqCy81RbmQByuS9M4pI41X2e7HACAMHAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Go+pHECyyryMwL2kG3sSZyh9Eo2IpZqpngMY4tqMi39/ZlBzvJNB2ABezf9X7RSyfjnqrYyKbkw1CrO51RgbjJKMbB2WYU9U+nLcHCPgBnjc44025JR91olctKL7r3bRh/U67amNdvy/FlQIoOY0GGFx0gHvlZxb5G4BWuqDREQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcHoUKs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePzvH37v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcHoUKs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePzvH37v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndmp1578679
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 11:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yw9j1qGl6NArU1efc9s8bFcu
	JKH5i25QV+0n7McKYVo=; b=XcHoUKs/veUguy07LVFalVzgLdkihV3soJcu7cgr
	9CHG2CkHAYAxVfr0MljVut/Dqlzon4yJvf0UFxySpWWg4h2KmHF5P1i/Y8xD4rFX
	fbYkD34Glww7WIOnGeLu/YvQNQcw/9Csj/qFh5oQJpmN0nZhDfGtANPtMt5+fzaV
	MOaYhnVhKP+EnMtSqF6sJ+EbUZbM8x0EzcEttbB72/f5WcCs/Lt3SkwsxELmZv/j
	++NeJ64p22LVVTYKkuYoTx/eRU0MacPkJal57aMN2ioUPhbNWlk3qbYlrkgRTiUD
	fhop9LmdvNrs+b1Zo9Mk9e4UWWTnaifvHS8GFtdTAUApDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hthv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:14:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso9682281cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786014855; x=1786619655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yw9j1qGl6NArU1efc9s8bFcuJKH5i25QV+0n7McKYVo=;
        b=ePzvH37vWQb9zYoTdSvlatXqQfYW0+ZTd1qab25c8Oxnj1aaS1sDPkGfI8+jkni8To
         WQFtTKWFYBee1c0/2j82cEAEw9zAdl0qIG21l03LU8zqyqFOFwRaTSBXvtDRWHJTEQvx
         nzKMXX5hQ5YD7H/n7NlmZvVSvalHEfO9VxLfm8JV+t348OFvGNMXzyxMzM4L0sS5QWWF
         nzMlzg33DHPzNQSU9Ntl5mlEbDCcE+6HVco+zjaNbOsV3fJF7D106Zj7oR6j5EMMziZ7
         4GR3Jwcflg9W2A33+u+6cBnNEnTPSGY31ilRMnvFpEwKd+QwNADgkKVV83zagLFz6YWi
         MmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014855; x=1786619655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yw9j1qGl6NArU1efc9s8bFcuJKH5i25QV+0n7McKYVo=;
        b=jodyabqN4fIpSkjdUmhZfvfIL/UvVjcWHKrlGw4eyxeogP11KAMbvfK7LnOJpW+tcC
         Bdcb95akzILT86KR3eNzbxLPq6pSGsmmkqxv9AB1lzXL8h3NUUvMdRj3fyoMQo+XmSL0
         dfK3yHaHf+0/TBhv1at/5YUCqvcjY29Md7NDME6G2DwNCvuzgsz6/UNYZv+mv+cUqggN
         lomTa1G6yjI5y2QKjZI+6R5LjKMeTmR2TybuVyRb3Gb+YQPlboy1AqSLFPZrMPc7iBOk
         bEJbqaym3lp4po6sUQBkIIiuFdAwqF5vukWQGSyylsZzlTzyC5EmapmNUoLTuJR4oKmL
         BL0A==
X-Forwarded-Encrypted: i=1; AHgh+RqPxfU1rMRuCX2IbAPKUNCKQpcUEG/OkangiO8AIBqr/m8PHiYzpBIR/iq2cYc7hJVDsPN9a7adu3uPJMJN@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvSwvnD+plP2gTiXZxMKKBXh/8UUklpz/UXJU7TSxSuor8cNu
	iB6lyLlD8jwYPr1SDVuEo1WV6/akZAs81tluphwkTUyQIjkpI9c+8OtpR5rMzJ3sB4oAggT2Nqu
	QdjxvG7LOSiMsVu0ubjHzU2dr/Xw8VFMk7wwtheOIxgFYW5JVDFzK5uiG8Fg65l3KevaT
X-Gm-Gg: AR+sD12GKVXi9G6DDP8JTvq8FHAG2QsgNrrdYdrQ2SIRkc+IIG9z1H80HmqIHcYF1LO
	66Wc8TECCJPBZs2l3E7p3XUC85Y2byW04V4E5QIypMQjEoTft5Jv1vUZXFsjjpkLZ7l05sxdhOW
	zJ3lqGPApL2L0ai1JB6ufLHklUXFVpNzEPrjb3KdtV6yXUIcbOQDgUwSj1je0WlWUL9IBtCKhTK
	a7w33eLg2woOBOO75EsqjCPXG8X81sp+3327/jS92+BX29dVXp/u0Q2/1Fx3OYLxsqmFRQltiGx
	GYG9BBMA1lzeVTcw0mb3SmDJT73BTCM4ZoWsn994p6oihf8eL4kRvuTcB4SU3Whu9HT+WIG5IO1
	PtyyvHDW/6y2VNmQ6bLnX7E62EKPpiPXdSXUtX6D38wnCyu9pCI/FZUnnnmUhPqxR/1kckuR1Wi
	o+kXbeiUu5TNzmmw==
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr65695481cf.16.1786014855370;
        Thu, 06 Aug 2026 04:14:15 -0700 (PDT)
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr65692081cf.16.1786014854896;
        Thu, 06 Aug 2026 04:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c92d3sm676901e87.79.2026.08.06.04.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:14:13 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:14:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <nht5phhqatbc35rh4l4r5lbf5bytgb2zmesv433zjscs5ye7rs@6y4bczl23nao>
References: <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
 <Ia82wa4IJDPkQZpTCt4MDMqtq1VGZ7DqIaJFNvV0MjaT3jjWrbD_iBs8RU7pqrIz-ZTMSK2irncUv7-PZ-fvkg==@protonmail.internalid>
 <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
 <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
 <ea0f1777-4615-415c-86d2-2a792ea42b3e@linaro.org>
 <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
 <72b267c5-6490-453a-9900-b196d1cfc5f8@linaro.org>
 <2tWmEJ8s0nm8efbgvq24Zwo1vkuH4Na_gC6stCr9_O1A9k9JcA2-TFN5qziPoORYrCKyDgjscvGyO64HI6qVqQ==@protonmail.internalid>
 <72b4edc0-dc80-484d-a2b0-88ea11ae001e@kernel.org>
 <995779b4-925a-48a1-9288-930e0a10b7c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <995779b4-925a-48a1-9288-930e0a10b7c5@kernel.org>
X-Proofpoint-GUID: 5Ko8FIUD5NwnguIknz4uuBe6XduCnNng
X-Proofpoint-ORIG-GUID: 5Ko8FIUD5NwnguIknz4uuBe6XduCnNng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX6jSYwxGoMSSj
 zk7gxso5M6G8oIizhRkL5n3TvBZ1YHyq+tWs9Q91it9ha8CuFHlNio2YoQG332mWS7Gf0aaXThE
 QrK3HAhObVjAhmM25e4dm62aHxqBslgrZyOYW8hmrG/kPN44JEBscV+me0xbbZTyHaGyCl9hWhL
 OqoNNik6ZN+0mk5XoAfauN6IZD7Oo9W1vO5cDr2zo9nwCTprlck5/i0wahG8cG+TmszYOVaf3S/
 yv/pbOWtsVJuzj7JYlMqIU3peZ/A0ELbzw3fBD/7t/im6lh5N3m9yY/Wl8b2ZAWHQVpIzPFULZv
 impdTJ1/w67qKAiWS+I/pclyUxjrxX0aWm5i6/cNz5jVgLbvD3/XY3lhPzBFjdaYzp9EC89FPM9
 8AkC33h3d24MGQ4BsjwfU+gjxw7qXndXs3RPS8OxINfFQnaE6xh2M4dFwHdXWGQOWJOgKXPQ9tU
 O95YsOLgwYd1n+Uf4oQ==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a746c88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=tw2GxrdeZerpTHTxB70A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX5i6TEhj5OEid
 eBxUqaaT0MAG1vK5Ha0EQ9l79wSSkev6H6gHuLMgEia1zT6frZqb/OyhjFdcGNPyPR6D2rfALCd
 Y4HM8qWqWeh1/FHCvRpDL8oOj8fk4aQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060088

On Thu, Aug 06, 2026 at 11:50:01AM +0100, Bryan O'Donoghue wrote:
> On 06/08/2026 11:32, Krzysztof Kozlowski wrote:
> > > Yes -master.
> > > 
> > > My issue is how long this will take. Several kernel cycles and the
> > > debate is ongoing.
> > > 
> > > Daneil's fix has not been applied which means the replicable system bug
> > > is out there in the wild, not addressed.
> > > 
> > > Daniel's fix could have been applied and rolled out to all users in
> > > mainline and consequently stable.
> > > 
> > > Instead another architectural level fix is still under discussion, which
> > > is of no value to end users whose systems can reset in the meantime.
> > > 
> > > Its just not responsible behaviour. So I feel both of these drivers need
> > > to be marked as BROKEN unless/until a fix lands.
> > > 
> > > I'm hoping the vidc team will come up with something else.
> > I did not object taking a known fix for the problem for the mainline
> > kernel, regardless if the fix is optimal or not. I only objected the
> > reason of taking patches because of something in stable kernels or
> > making backports easier or whatever other semi-expressed reason, which
> > is not the mainline-kernel reason.
> > 
> > Best regards,
> > Krzysztof
> 
> I'm all in favour of rolling out Daniel's fix.

The biggest problem with it is that it looks like a hotfix or a hack
rather than a proper description / solution. From this PoV we will land
the fixes for all the boards in mainline and then fix the same issue
_again_.

> I don't want to propose BROKEN but at the same time the timeline on this
> demands action:

I think this might be a solution, which everybody dislikes, but in the
end it is true (for both drivers).

> - Sub-nodes proposed around December ?
>   Which means the system resetting bug was known
>   and understood but not promoted as a bug requiring
>   resolution as it should have been.
> 
>   Fine people make mistakes, that's life, lessons learned.
> 
> - Daniel's fix posted.
>   Not endorsed or rolled out. Its not "perfect" but
>   it is certainly "good enough".
> 
> - Now more debate on sub-nodes
>   I'm all in favour of that but NOT at the expense
>   of replicable bugs from real users.
> 
> TBH, when I start to lay out the timeline on this, I get annoyed. It seems
> to me qcom has understood this bug for nearly six months more ? and mainline
> is still waiting on a resolution.
> 
> So I'll leave it up to the vidc people to decide. But some kind of deadline
> needs to be put on this.
> 
> Close of business GMT Friday - either something mergable lands for sub-nodes
> or we replicate Daniel's fix to all platforms. Failing both, I will have no
> choice but to set both drivers to BROKEN.
> 
> Stability has to come first.
> 
> ---
> bod

-- 
With best wishes
Dmitry
