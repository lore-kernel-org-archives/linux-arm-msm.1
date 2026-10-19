Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD94C9DE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405925; cv=none; b=S0db0Rw+Q7j+8QoigW0xQl6Sil+rGw5O6wtpp32aDgi4ZPypIwYDO0OGRydrJcZh1mDGedwJd40cJ4N+xzPP89U3oKouJ8U6k4VI/Aeh0A4h4Q+hIDR0MmriD2QHvowlYrPowSMTp7ZkTck6MW1WwlATt9REhbK67M/J4lZSTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405925; c=relaxed/simple;
	bh=4trbUtUGxdoEwUCtKJvBBNIQl3//HqfI14DxYCxZ1JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUfL97srDQPFpBsVOrXhYcDLmqubMFMj6w/8aHVjTUdcoWzp5yqZ0IZ2o03nxN/+g2yVNKG47mNNLTwL8n225a7uAJ6hfcuN/wVccc1D6t3EiwIgYgQZD3TyH95fYFfyR7TfiY6wunmeTD9ZsX3VLbkeHxs8xt1xB/X+kvXmftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERcGbE9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A64ug3e+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERcGbE9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A64ug3e+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrEA1167943
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5EmfudG/tQAKyrwRj4Laa20s
	3oN5QSBgeQVVbHVa7ls=; b=ERcGbE9CK/4fSPW/p7zn8UToX/Yi7ehIEyomS+Zg
	NTYqDCss3W9PfGf3Wgjcj6FLyfNMSq9FbZ8yTXUTnJMSxzRUwHA3EKzfriI26Jkq
	Uqx3J1pJa0ApiZLnyshJVRADpidW9+fO2dnxtaIdutAvycUdnR24TfJ5jBSNxdxr
	fFr+xuJW0wragQO1/aoqlIZBO24XeophYnUHOlaY71Q4h3k+SPniY8uiSH8lyF6n
	YrsqzhFxZLnIcxoeKGE2+t/+9OB718Ake761gYAH+2SIJ6l3jKsrUjmaaCe+gtdr
	+CKj3zZqYZX7ArQlF6D7Z0t1ujI9bZ5CazrfZjLrTfvBZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8m66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:32:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso469811285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405923; x=1793010723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5EmfudG/tQAKyrwRj4Laa20s3oN5QSBgeQVVbHVa7ls=;
        b=A64ug3e+eIXPqL/u1M86fEwgQJmgjdDTiSS0CusmvhvGpz4MpjeLSO8QDqhdf9LYrc
         FeI0+8ydiDPSe56K5y74QaDNwehJ7DijnzS/XnQMD8j/XvT3zZstoQ9cZrZY3vfkhGge
         CUcgbspS/QoE6y18unVG7b68+x9sY+7VCFzOH0lInLlsx1gc9ZakHKaIVXWTHKX+6iJf
         3i77bzrdidD3Z7z2CUSsB2YaJlZr16iydi8QJluIPqo8TmU2FwUOprkf0azAcDBjH39h
         ehXMcODrgKyrD5tUGfqZjgkrVrFWGSHCDYe3JLi8rXf9uk+C+lIuHvPTTHJzln5yM2cx
         uEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405923; x=1793010723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EmfudG/tQAKyrwRj4Laa20s3oN5QSBgeQVVbHVa7ls=;
        b=gvZbxeU5Be5Mq/YMtfH632b5SE3Cnjtlh9L9A9eHrVBf/dsRkJ4RFd/bXelpD5RuGX
         I5wlGlYTNAwnNY8Qyku0NY06I+mm+1IXEgXHCMEJLDyaoNPzVRSgMooRaiPFLQcWTV1l
         IwYkNVm7gDVaeQz3FWWbyikQUvdbUVBX8xia1jlt/b94GRJP5xmZYnF1TG9iNjjUj8pT
         m2N9Vem1JLJmXDk6/jSU43/kA+FZA7SPwslrtTykHuzsvCW5VpTjplrg5HuHH2ebctFh
         xUCeeNpBMcZETlIiRI9BeeBFuT833bnPLus5t7KY1NG9Fw76FV3QssM5Vk6HVo5uVMwK
         PTSA==
X-Forwarded-Encrypted: i=1; AKwUvBwm62L1USyTNj/lpRhoO8/2JpsF+l0mZioa8tLS/EjVbfBCe0fk03C0dKyVn7KdG20LBDrLGRt0L7WKjZ+6@vger.kernel.org
X-Gm-Message-State: AFq9FYIh3/PP1AvIGTsKO2crMI8+C/vZZsQ16ojsKXSoXjpWBr3jBnNp
	SoAmLxXW+Hb2x9WvLuPDfcjUcmTCWCs+X8WZtQkgWlLZwnq+q/XJ+EcyQZdlnfabFgeB5lNVP2P
	lqugOb1dEeYVvNjOSkMMh8zOscThUyRVnWOXKvtVOtsXgv/4g7OGIKF3SvesU7iE2YZEV
X-Gm-Gg: AYBFou2uo3R1bPXOdtSCjm+67irxMlBopvQt4v8qknVijtNuoUgXHlzs52gh1QAVng8
	L2UZGJNCRML/hrZCGgkbkB5r9auBxHali1AdvhBMYeVpUM2UMh5YMUWgM7pvS5Grvt7MxrYps0r
	XealKMyAu6Jh9mDHtRSiRMbUYZZTEyJasC5Z9IcGPe2vVrtzX/wWm+qEN3flcAk7AL075EZ9dCv
	VIYdmWtItJC8C6FLZWxdPogiEy0txFoFM3ZPGM55CbNPHevVzFG8GeN7uwIr+VuXj4HF7jbMRsR
	7vgomrKzTOqpeXLcTGE2igJHSy/ir7pJ98tnrs5T5DUfvjjwWALOpmEy0loEKaqsG4nTVay5F2h
	jJoiR7uBiAqnSmTr8
X-Received: by 2002:a05:620a:29d2:b0:93e:910c:5fbd with SMTP id af79cd13be357-93f29db8a92mr1174459585a.63.1792405922704;
        Mon, 19 Oct 2026 03:32:02 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:93e:910c:5fbd with SMTP id af79cd13be357-93f29db8a92mr1174454785a.63.1792405921989;
        Mon, 19 Oct 2026 03:32:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm22322630f8f.29.2026.10.19.03.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:32:01 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:31:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for audio
 PD
Message-ID: <yjsxmoecw6o2guifj2kprmb3l5x4rqduo6hnvkzzz4bp6efghk@zssuwn6d36eu>
References: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX7jCWPjqoF9lO
 eoY/gisU0I6PjW5AD42TIbvIJBcB3cgPcz072oL9clTRjrMIipmOd6bcZmONniyUS5TD/7oXdiS
 gawxM08zrEBwYgLDNfpg13ckMStDbXI=
X-Proofpoint-ORIG-GUID: VZnex9pWHfCtWQybANv1DLCvagY1zOwA
X-Proofpoint-GUID: VZnex9pWHfCtWQybANv1DLCvagY1zOwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX8DlFhexX3ibg
 Y1BsBbNuCdi8wVdRqskAGXisuaLSEKiy1j8QM6VPqZY8AppzJ5SCyeLbNS8mXNunPNYpM6/m0Fj
 7KSl6IjJIpOF0RLoy1MXVnAckCkK8nP7rPrUGLkMBh0DtoEEVH7jhAA91bE9I+sFXpZanJNKG4T
 4CqRkS89Xfny9ljQ87WJggwpg9wgZrM9nfjNNDH5C1Txckn+fALSZD6Sw3eVDwxXIiOfrU/Lqay
 7pjXWDTWKs5EKIN1f1w6AKc3aA5O0BLX7phVxh2GIy/5/Tk14Z+iZmdKUUexWbyKL0OZQOb2Aaz
 BsbsuvlJVngL0DEX6YbM57ARIPO1moFqW7HFVVK941RZie/tGcnM+JlqKERcNVeeKeJ4KyWWS7h
 Nqvl0Tmfvo8uuVL5MVF93HSwnUw/Snoy6WQBncyhLJuK0PsZ9RrAw74jADbErT0yHDAhdFOMvq4
 GNZqYWE975ZsXgrmfKQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5f1a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uWrXBvF99A4s_EMQbgoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-09-22 12:57:36, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

With Konrad's comment addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
