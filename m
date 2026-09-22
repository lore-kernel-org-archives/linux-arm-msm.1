Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BA24E01FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060728; cv=none; b=te612CXTC+QXdoRuE5v+NpMXNZgEp2cISGvMoS5Xv92lj/dhyb504XK3kJPuUlAV74xreQDivi7CvWC7f+Cb69Ssm+Y3STE2c2sWMilN+ezoPe6nkYM8XJefsskI9QOavwv1hqQ0awuEnlvFCkZjCbg3SQCEkKQa+XHFpmtUO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060728; c=relaxed/simple;
	bh=hBCN6l1ThVhC4fGeX/a3GQJUpEjGP0OgH6eO+/Jp1gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0gUzJygYmCz2/5pxFyEsEw6/mWqQYIq322D/OtBXG5iiYKZWXG6CSISIVjNV8dV24tanu9cX1F1KVlnrkLGczmH4UZSX7h2ZpXZ4mGseEg4RmPgnuwpAcYoBOj/WNGd18bYgupwqbXV1C3VEnnF5CM/Ycqi7v8RNwcUtc/GOBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6iF1W4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgANO0SW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6iF1W4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgANO0SW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Ycb2166201
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GR8ZfdkRB66jty9GgiKOimRZ
	Wr0nRSeTXdMImkAoA2w=; b=G6iF1W4V2TFY3dcvk37Pm92nEu3Wh+LY8yJTvGQ1
	vF1hw/WUqThctWkdlML2beHMc5lhqkYApVEUV8/Fjkf1JMTjVOHXpNeIjYrPqWDX
	+eCy22zGK7mqSBlqGrEi4aEz4PNTLB1okbP5ZGLsR1NwjyhlZx3Ui7qFcE1Ytl6M
	SORcEI65ACDlN0nr1tElcVdob24K2YBsgpjH6i9MwiQbl6ljbevM2HqYIjPzv46F
	g4dWR1ANvYAD2ZODgTaoTLagrgyP3oqV5XVa6H6HcSqb03TXKJ9hOFg810lpyh4d
	sCSB5RaLkcWuAC69nF8TTNyOyOgbunbpgWciSs3MuMP7NQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetq8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:05:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so644351285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790060725; x=1790665525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GR8ZfdkRB66jty9GgiKOimRZWr0nRSeTXdMImkAoA2w=;
        b=VgANO0SWnkUqvVkYpGDqNpsme4WCsCMonQ6UGqKnGxfFvFhn5tgoJsBFHgH4DSDu4u
         JZ01yN46FLcnEKbPENk45XzzuQNoSZBNcv60sJKAwXRfAe3G1dCtbv31vEvjh4pZP4Vt
         qKe8u7AyxrHE7kc9tvvxUbnIMTMZI+sKi0+iuJMOr1ALhXklQL/2zxgCQII93zoAXtOC
         mc+cwMhWj3KlKsPvDoPqGCR2TEFsmbXsd0NMKHvpfdzApEgeUKGd4ricfTmynPtAz2Ku
         VSK+FYTQwmKLAEjVRRt/vnjpP6lYll3SypcFEJ510Tp1S8TO8VaGrenDWelTsQvKAZ2/
         KzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060725; x=1790665525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR8ZfdkRB66jty9GgiKOimRZWr0nRSeTXdMImkAoA2w=;
        b=IUfiZ6ibfYXw10MblT6orA693wdOEv3BysK7+xaTJw/DnP5loQ6w3lG2qBffktraY1
         YQkIGQ9I76jG5xgB9QtRXNBRJFysQjz5v188a92g2pjqTttHExMt29WTmiM+8bDc+oGo
         0L6n7FdiAfihRPzLFZAiHrrzBw6ancwcjUQWDP2XkHRZlRqNvfxhx4iI1n51FTQ+1Rsg
         Z96v+YKVbcgeQD7dHx3pQd+MRkdJQ5ZotaN7Yp/qd/CBpit81QcCo3IbXkfXzZfMqfy7
         nOuZiW1zvhtBO09so/CdE+YjyAgp+457RPvhQeWNdkLeLYwsz1my4Tox0jHp1R5jiyAL
         cqsw==
X-Forwarded-Encrypted: i=1; AKwUvBwSl5xdXgb6nKf1UZRimdkS2HXoOcPrJiD8plDJPjqPbLkPPStCZHGPw+mZ4awyq53dLL3l8ybxYNrlO3RM@vger.kernel.org
X-Gm-Message-State: AFuF++mKRT3Ai2ZZgV08tJUh1faIkCQiSkGrD+Wi4c73vt91P0P+rw8Y
	Dk24KB+FIwpX4R72kaSLVw8Dxp5qTUwfEu4OHYh2nw2x/aDaGX0ITgp9mAShYu1xFW5TTNLtF1B
	RNx8gVAbQAEuFVP9O/j2BFdG3a7edNXiS1u75J7W3wGKdrFwjftowjTDSlquWjVfLUITC
X-Gm-Gg: AYBFou2ckSl26F3YCMgYKDc2vw0sfsFXN8avlfIlx9K+o58Zxk1OI6QEgi+Q/Ga0KWq
	jqjFv3vqwy/D0TMwHdMNKanZIVInJtuy37BSok/CJ4HlUxgcVMVQosY4riyKSa+t/UJL4VFIt3F
	iC7da7QVJcZ4RiLehmJ3Qz0shjMvJ0rOSnml46QsvGQeVLyn+vzOHTFKkrLATJAw4cd5HrLIHim
	Z2E/hCYxG/BorqDWe50fcSGcel+0nOO12iNF/MXpvrLXHY5xZ6vaKyhQlOBMA+6ctHt36vlzlTW
	6ce6JEZ+upbYSCmyv7T3vIspwn/b5qh5MMCkAYVP54Qs6CzSPDwqkz1PP3/o4smZf5rY+kSAXCM
	J2MT61EkGk8YT7w==
X-Received: by 2002:a05:620a:454e:b0:939:df5:977c with SMTP id af79cd13be357-93c15d918d1mr460321185a.19.1790060724896;
        Tue, 22 Sep 2026 00:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:454e:b0:939:df5:977c with SMTP id af79cd13be357-93c15d918d1mr460316885a.19.1790060724423;
        Tue, 22 Sep 2026 00:05:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ccc053sm59713495e9.7.2026.09.22.00.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:05:23 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:05:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
Message-ID: <ysfvck34o4qmck32smqrcwmgnuwujxhjcqbew6t3hmamddanvc@qgul2ij6mnq2>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uxkrgo3LrWRb8L2n3FL1SCC71FsXbqxS
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab228b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r1vr85uP6TVZ_mIZg3oA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uxkrgo3LrWRb8L2n3FL1SCC71FsXbqxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEwMCBTYWx0ZWRfXzidz8w0fSxcD
 JuIAgP0IuWEf0WedNuqZ7nedVl9Tdf+PD+zMD9XmIyms/jtjJ5kTegjBESjYgNuevQoUy41kyfS
 6v9eEJJoEHg/98pXPIB0GZftJb0BEQAogSk5GcEbFR+Ns0ydwKKFg7B66jsC7WyFGFfMWrPEO6V
 WzbjDwuSoXumm9BVHPf1fXRmbY+te7UPEcQ05KJ+Rxf2yLz8Np0m3Y9nFyuYcfim2mclNEFhWYV
 jQwnI7oZUIGAnSXqf/j5LUuADyO+sw8J5GhJ5gfzIfax09P0zxhTld0BHlelsz+LRk6zcEP1+J/
 UO/byQDivDrUVXhkfrmw0WVKPNG70APuewzCsnFM/KvBFELsQfYfpk+91I3Pm/IsSfmxxvQT8pA
 48b+tL+q0V7lTu87y1YZ3A9PB3L08d/OxbeOWSRH7v8kbK5i98DeVQMhCdrOQhLMkE4UT/1DB75
 iOULEVlfcW8xxShm0tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEwMCBTYWx0ZWRfX3oT67CKEc0G/
 y4KUqt4z4eX/DgJIQ/+EuaI/pgXUM90tSGDgttrOlEX7C2Zb2K49hOqpScFxdNxfwxFtLJsZUO8
 27MnVJ0Dq0MCXwyH5Fq9N6eqB69g7dk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220100

On 26-09-22 12:10:58, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
