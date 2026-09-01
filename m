Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595D83B0AC8
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264251; cv=none; b=qdmQsuO3xbDZJrBMMqGLu5e7XgaC7SsQ0XpwRPPE4z7FDImp+5tfkcStn5GDSWYFHve0/8qnP+gykEftPHdbtsQvwcB56KHdoH7EWpCYsUEiPD+lMPhQDAhgYQv5NggmxT+tqXm0imsPpvPdNZu0Z3TEjCbhR8R9RKRH10h0b1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264251; c=relaxed/simple;
	bh=pVeSOF/f7uQcPa36tMUD3FIg3wIrNDH+COVd05nTzz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blc+i+qtFyMPYrqWOPViQ8VLqpvyTwnbreWDYSlfHIeWXqfL3SxPnKPtn16s/4obMjkU+AOsRYKUp+KLrTN3eCSVkdvOEbZ9mP055eS8FvgLjqC0Ppw9f2uGMBUyOoEUtyaGhbETCV+5ZR7gCTlqjYJPxaGIE2a5qw2z9CMdgRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYIYaiql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPD4xT5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYIYaiql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPD4xT5l"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJctM2406413
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nX/6r2nOz3Tf0eBMGc4EdUQI
	DcqpozJV8n/AkoW2T0Y=; b=dYIYaiqlI1YtGMx3cdE2yoXniWLlbDdlfwzIqGjq
	ywL4nuI6isKKTwyXZh1rPw+xSSBrvb1kUT1eztdEgT+5kBBueXmgqvC3Q3r4PaFs
	PnZ/RtruiqONcwJr+V8eWPLaSR5DDUMx7wMqh32f5QxBvVoq/t5XBvTlSwnZE0S4
	VBgZiV/R3bricAs0SB+k88ZNKhgSxJJqtud5kul7fiJBgL5FQsp0KwUU47xLXArq
	uh81y0QIGHc7xAjnpntoF0ezdF4IJmolDBrdPNk4NhOGcZNjBKDVk6ASbDjvb9Xj
	IN/3tGO8Y9Cya9W+Uoghy3Pld59WPrV1Om6egOojdQxzxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r26bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:04:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so99320685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264248; x=1788869048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nX/6r2nOz3Tf0eBMGc4EdUQIDcqpozJV8n/AkoW2T0Y=;
        b=KPD4xT5l+O2G/u5EvrHsus9NzXkiMmquI5XFVuZX0WrhYIr/WbKUfbaerqFDzRZBvB
         f9LkzMb8JlelDOAFM0/fUzFaiRDhC8gj96r7EHUv1/DbY7IAjTCVzYAdJaFK76jCZzq0
         jVH9uHQ+becGr9+a499e9OPe4z/Bhsc1O3s3XdhweaCX1ieJkZC0vAlBzFh5CcC+BSHc
         k1F030jhsvNeFh0lU4d4CtfRMUODsHQRCV3sRYXbRRgnaj/wV1VAXZUiHcqJ3YcV6/ym
         5sGF+I9wHnXj9Zn2FFu+HHMMqjedQCyz8u8VUZOgUIjjqOqNdE9PqkcDLVeOL3ZjPrdv
         o1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264248; x=1788869048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nX/6r2nOz3Tf0eBMGc4EdUQIDcqpozJV8n/AkoW2T0Y=;
        b=iubAmyiiJ2YbFMh7n3ooIVaTIvC4JKShSjJErkWQSi7nRmn/midgOaPN8CpTEoLimA
         2TvjURkq2uZVE+wt9F1xvuvAd+ZmXhy6Dj61JW0dExE0L8314mi/jqt+fh17OxWZo3Rb
         HBSUwCPu+OE352k0Y6p4vrl0m8TWl3IaimU3BFXYp2G4Vq3Zko036hRU3IFfD2Fe08jc
         IxVgNjDvndAX+dKtmc+pP+G7s9/PN6ejugDOdy318D4vAT2PDrwjuqLLQ8+iPWI4MlQr
         sbbVwtdUJbqxpTNC2yeg/xhkP5Zy0EXFddc3XIqL9zAa2opt7ppxBITqv8kpirYSmCCd
         Rd1A==
X-Forwarded-Encrypted: i=1; AHgh+RrxybC/Kns1zC6u/tOMfkg2r6PDWoQFXGhj9GOir+cSuDw3lYrmyjlDeLf+N2Hutnsi+zGR+AH1J+RTid5K@vger.kernel.org
X-Gm-Message-State: AFuF++kyTMCA3YV6H4m0AhusGzNp25pxFRkFiXLSf3HiPvbM4tEGvpPA
	QBGNjpwrvAFc9W3cWmrpc3iE66F93s1ofE97rQ9nq7JZA8n3leUeI/SW1dtI1q5eu5CefsSnYlK
	sd6g2N0r7bRKv9KvVwqyZXiv7UcDWoLgYm1Exid2M2YCidPOUjOWluSI7vFNoxsnEdnzw
X-Gm-Gg: AR+sD12G7JxyvnXSy6WovDV+3z1y5lN45hWzu6HNMQjrVFakKm4MeMsAdJgDPQ8obH0
	HUtaQmbA1KiwM4b1abd1S6YF4l156vtIV3zOkcCZnFxHvNcZRBWSbc0hbtFNQY6jBIYRAlL1j+Q
	6kWexhyYQslTAtnshpl8S2JmqGskrAc208emOSpBLYV+TYK4nhkucu4tLewLw2C7+viy1Gn/tac
	wm8j9xnpf8pZFXKfoyDcG5P0N5e/fVlw2EnsgdN56Mu3Vc+dNUA+qQ+N6+MidpWCAGgnQnxijg5
	kBlMpxm5OXnu08J/0quckTFkM2nggb/K1vVva6GSdJLjSxQ2L6BNJtb2Dov678LtOp5XlDDUv/Y
	kiVaNqY9CNR7sWxc=
X-Received: by 2002:a05:620a:f8d:b0:939:7fc:cec3 with SMTP id af79cd13be357-9391395e55bmr3250731985a.41.1788264247439;
        Tue, 01 Sep 2026 05:04:07 -0700 (PDT)
X-Received: by 2002:a05:620a:f8d:b0:939:7fc:cec3 with SMTP id af79cd13be357-9391395e55bmr3250706385a.41.1788264246216;
        Tue, 01 Sep 2026 05:04:06 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d788ebsm4651556f8f.27.2026.09.01.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:04:04 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:04:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Message-ID: <edxed7tn4i4ostqaldbi3ytsv4bkhnfkootday56sj4g4s335a@xsgxhopu5axs>
References: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
 <109b0a77-82e0-4eb1-868e-48a8c592cd6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <109b0a77-82e0-4eb1-868e-48a8c592cd6d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96bf38 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pxLU6pXUeMuNvs4zQuMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX4tUL1XrfuH+V
 v/7yKta6QEas7bVmQjs6EDDfEOJkuPKABqeLPD5PmwmZ46RbjGQI86FUHQbTDQU/gxhT5G/Z0t9
 IQjZ6xtr7DZin3ibRv1XK9UpdUE/zZplCb/wo7rOwrbI00aGGT6CFKXHexrwj+YHKDlhk8xUDn8
 gGltAdu/mNtPo1hu+uJdNOoCRw9gVoBSBosVRS6PDULrG8OK9KmI3JkX+oqc6W3nOxIyWmIbUPo
 bDwquXcpwNk92FUS4XAuDhoFux+sEyA6WgTFgvLuBvQVy5hQwmyjEUfvqGiLRrjDUYFuOn3h3W6
 XX4GDpenaoxPMWLmMaFaTcTYPGe5Z+34IYT0rQAuEjHI9EzC/0IE0sOZjrDEYAFtiWNNgbrG2ry
 8/I6N98m1bRcmhr8UIyLXDTaN/I6aHXqrY65Bw37omGXTi0op1lWmsknanmB89XcV5K4CPKHJSg
 mY7v6UehNcHsKQPhEpw==
X-Proofpoint-GUID: OQtRi8LoO78FwJhznnPQj4Y1x7J-Ian2
X-Proofpoint-ORIG-GUID: OQtRi8LoO78FwJhznnPQj4Y1x7J-Ian2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfXzsKbdlBxVFms
 QFhY2OT79yyR77WrFCX672pD9L30B9AOoARVdKFMbaI/mivk6ruBJiwTgvluagvRKP8HIkR5QZD
 ZrAZLeM6jEm3p4zsjcZ/u4NhUHj9epw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010107

On 26-09-01 13:14:47, Konrad Dybcio wrote:
> On 9/1/26 10:22 AM, Abel Vesa wrote:
> > Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
> > shader firmware path.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Either "Adreno 722" or "A722"
> 

Sure. Will respin.

> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

Thanks.
