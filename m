Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462726;
	b=wR768r/n7xmFPOn877mNvhHG2pyRVfv8bYs9If54vxVB8oRtQ0ZaMgbUG4q2nNC0k6Ti
	 t+Brp+fqJHLDuOpeby09fUvZaeW9mivJvn9IENg9pjy4oyeEj95C6m85wVir5IoRFEkX2
	 rR0uXhlhIC0ptVWlRUQUTvVqaNCveWsZ3d6tCQRgoDUjfIsT6lV925OSfcsTgMo/n90Rz
	 7XRbpPuAiE4G/NS/WX+G4q2Ip8Pz2UlMzDfsP3rS8kWoe0PoXRXZsJ5owbl8n61RfGZjg
	 8X5+Iui860KFqhY35I3qVshelF67rxiWh31sqxNUKQlNha3/jC5B9Sn0f91nrny+T0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
	b=qV9+KP0Kd6+TGnS6aqHFwNIbPDUac6BEhxAqA4V72myrV2h3s1TmKYV1jfjguWWO/4mc
	 ZiYek5ytwFBERgyxEjr9/sVlyL+eOogxm51fsKlL/TVOVtjgsPfO1vuu3ya3DXzv84Lt6
	 IuyeYdV3TXIOgwSM2py7xQ5h0OPMZ0ivXs/vRSYI1j03zBz++lXgqFkz0CvYYjvOb5S/U
	 RK+Ilun9qKOc4/XFxzf1ZZr9lxgxLCMMcyFlEWGZZCzSYLYYeiGQNjddNNgH/PCp4wt+g
	 a2VZgtkUhCD9+LLJk2EbcJxVidhVZb+zMoDpiRf5ciZ2Q176VU4fsF9cceBqJ1kkwWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evvI6gG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kp772S1Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95831606A6B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95831606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evvI6gG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kp772S1Z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8ls2769576
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=woJtGyolaPSm3epuc0oRfWRq
	EJQCl2Rjtu6xIFO48pU=; b=evvI6gG16yb0OpXZQ8sODJiJeD0hRonbIqh306ra
	xuLTFM1G8GcuFl5y7nIH8r9yXtxvkwhHASzlgE6xaS4oG5AvC0h0LygXzvXc8zHs
	SPtx8lVyt3KLLINiWrVUc3SWNGPGP8Ia8/Fr6QI4Gu2LXcgOQmYcM3dluIFr/HOk
	w2x+kcsvx9+s4QYNcgmsXdAbIOJK6Abh/CRHGjaPbrlBiyGsfl8C83R9/Lu4taHo
	GmUfF6iaB67NjLe7g2TWT4Cto8mNG7lzX75auIKcCEWD7unPWTRFOXO7JuwsSSX0
	knEpQgDNcmvdSk9UaI3Y+/JVHd8woyrD3gV42U8MQ4/WYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb3tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:38:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-947a607ec40so352379685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462724; x=1796067524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=kp772S1ZQlcvqnIgWKj6OJ0iWIzVS5V5IkAE8Tqs/d+wx+tkYygkhv0jpodD5WcXt3
         oU1d60R4xh/9YXlD6G4Tg6WngZTHfClMFaeOsL5Jb2A/xqQLW554mAF3Kw08OXmi4Tc1
         E8FILLrkQZiYHCWNHf9oZndxqVUf6czoJok1ZbYFyHimSXysbx4ZuiT++9Kk/UV41UzV
         poJjRric4eU+rr+W6NT1pxLfibsy/HqIirSJnxjIP5Cftsla2vIAcTbipJATpDKu3tgK
         F5/8mffMetW3yIC8x9t8sCzRcicKU4NkX5zdNprYEuPg+CGod5tEVCJoi4z2IdigBWxk
         uSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462724; x=1796067524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=BCIFRkUcCd+Y0ScO7gw0D9j9Fl7TPZg5aaZkMVCrEuJmBM0M5xtOKB8Zzwh6gD007G
         gEzZykBiGB4cwYMm1TwzYT24MhWhYrJIXi+bUaAC5DUrwqmcw8fn6worXNfnv6edSIOu
         qpwzeBlKWaFs56jpumFBSUWrjZUv2cTPRxldo8T3iaVKGwQiz5NTIyk/wP5y3Ledy+h8
         p886kyuO4HEk9ATz7T0DbK6QgpBcyc6BYhJIfQBhIjqlz7yxziGYfD97J2gT1SXdsm6k
         8cCEiJr186DJKLHIUoDRAG0lQp77rsuvNtb8tO03QCinW6T8ij4MGnexTj+b45eiIrr0
         l8Bg==
X-Forwarded-Encrypted: i=1; AL+hErHW4cCSPK5AZIVGNsz2XPHOdqlH6gqTj8/suu4zGDm+nK5/Y6Rqd4AzuuQWSv8DQ5Md43tMD2A/JjjUOiSH@vger.kernel.org
X-Gm-Message-State: APuU4Z+QtpB6ks1lR9tmzA1z/ox3ogGv/dcsozAcUGKI6n2zUJBG0LRp
	xGtN3cK1hMrZ0duz7IMqDQX6j3fg7CdHECILzi5jzVXzrb7rUUmOELRi5qBvOk+vvTGxqgmJ9wJ
	16e1iGETPp15yIGEHzXzSV7kwswsl7AGyzVUTO78gRH7M+rN6m1CogsrvLJAiOtCe+iWG
X-Gm-Gg: AZFdTZe0FAyZZo0lkviG/YW2/QDTgPpSoYdW78L/ccMMEb7KM+F69zla2sX5qMPzy5o
	y8jvejLdgQrtTt/Cpi3tIZ1sUmsTpDjZbJHSArrs731hIMMQanzHRyJImaPHHOJzF+9hc4+c5be
	x5KkL5IXeStIccvRjb5QpBlDd3JxY6lL9RSPZ2I9eG/0U3UqgV04Lew8owPrvESyKPt71tidvYp
	ZdspQRBfCypTxlpkE9pEY8fPIDu8moxawk/bsOiOK6BmEGwH9ALsWoE3J3Ao0BAnVuryNUsLQp2
	GwIt4k/JH/IKxMNSM7wheufVi9HeK1AxIAnE6TjTXodfFl409vTOeVo3d990PCN+O8xKzr5smfq
	QU0o0w1zIz9IZkU5EaYA/kcd3SlJlktgexGPKJF3p+fl08vUR9DMVUD1flspk89bF
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007144085a.73.1795462723792;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007138285a.73.1795462723165;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm24078327f8f.52.2026.11.23.11.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:38:42 -0800 (PST)
Date: Mon, 23 Nov 2026 21:38:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <xadzsuftq6la6asx4r3cdknho3hbjljpkrqr4iblwowbz4fhrc@yt2dbeff5d63>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwFWrNrquA6MN
 HPExc3dgEuZGGAMCEOlMsyN/yLq5LKXQI9WLkT5DjxFf0BCWn45TXCpRiFt+oKUQqPR0TsatXoN
 7R61hT9OYGMtYRseZvtshYGFHbLmkKKMLY4zZ5EpiJLZkJOxBgVu+KQrXfWGrSgFyTtZpccRRNQ
 3k6Hhh7RBD4MFKMDYRT8FueSBmYUqrvPKjy59bl1b6tRly10ySRrwpipPBLKp4HTBPMAoERs4Kt
 EsXzl6ZtVJSMSrWGA9+sZkfaJwevbFWKgGDOYgF90rve0UrrrDmt3cYUjJSDQ0JT2NUm+O/nqEZ
 Fdu4Sn7ZAYwDnQ+ZeFIR9mif8lAxjNZSseQsnFq3mLK3hAgifh0K5Gvh1MDQg8SU/mgZndFntFC
 gw/wFLneFqPe6FRR7qOppMxFJi3hH1wSKXB3X70tKCWuNFdP3VLCzrN/dM9PFGEnVO5tJ77DVsj
 yeamoav3Ek/U4THvWdg==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b049645 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=umFhNDnhut0qF75FkN0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: swSj6e139LI6GNeKyUbFwtWPtm8GBeyA
X-Proofpoint-ORIG-GUID: swSj6e139LI6GNeKyUbFwtWPtm8GBeyA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxBOGlc+WhgpT
 d/zxiHrfEeR1a8evTvS3oUWoy3x2ZfdyKvISt8TlOKii92qb2V72J3tIYwLconVH5YLoNGU6DYQ
 Vy3WgdUNLL/ZSxH73aaiUzYp17okGVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:35, Bibek Kumar Patro wrote:
> On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
