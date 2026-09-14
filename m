Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259BD3E95B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371614; cv=none; b=aXpy6kBtmSFcswN28EUC+dvG+x5Q9K9b/fZtASr6OvELgyYIGy3QajWslxvDSk4LxDK/1jSzoHzip3Qd2f20IlZ2WNxhd/6O/gwFkvKWpAvEZfMKL4GtbSJmIGNcc8P8iOecTOux7453eKeNSXAXGeoMT2xd3dL8MyPQjkQMJkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371614; c=relaxed/simple;
	bh=P2xRSEWVbbGo+ZaEJ3Sn0IktlTDvc+vMA1KqCpPXKd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXGfLuIfHrMDGc76dES+vnghykHdwJijqcJL3wDMMx9kRKMsm2WhyVln6TbRmMJRug+l476jGs1zZbXekbY3alj/Z5zMpjFcu51B6U6+5FvVZLO1UIzg1AXWaf8RZyGdOEAkt80VDiahLmMAMrcvQCogehEvt2SAopqpgfgH0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rt4AFe+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQ96paOj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rt4AFe+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQ96paOj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jPZe3842778
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EaTXnOlSU95/0lAYOwxIOBn4
	WHPGmn7hvZS8u0fcbvw=; b=Rt4AFe+5eeqOoOm+M6MIXVQoBv3mk4+3WRLdiOat
	xMnt0hCCUHAo1D+rGfFka3SKNKd6zCFG81piYf/ABaI0YByKBF6IdP03VRNL36+J
	UBc8MDuL3t56EYRe8yDc/PMmZwRe1hYQo0tEpoRHX8iORP38iDtuv41xmVkcmp6P
	+AGeVfAhZ7B8VWY01uQMjNgZjbgUiPWgeSBFr9AV2oB1R/aK33z6SPF9wf4OmN2o
	kNoyAQgQNSqtz0auuej++kk1DSqu9IOmVWRah9c6xZHvOXj3O0V+UA/CzvQH+0t9
	Emt9fzL+W+Jx9HdDDZSQ3jYNejFyKEq+c5zAffzI0bgF/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5jtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0312937eso178537785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371611; x=1789976411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EaTXnOlSU95/0lAYOwxIOBn4WHPGmn7hvZS8u0fcbvw=;
        b=SQ96paOjltYMntPz1XI+uwfM/e2UMthSfRBpxxbaPWJnb2aRz+A3pbuurQAuBgUzCj
         qCXOds5MJf5Lh5cCIzm+/GxB4nP4jwsNWOFdxDpy8KXP7Fpb6AbIGGtdnS0oJGfTTP43
         RtdQcOg2gEAW+BiiC3DvjD0R9pVZzcIDjD/FEoCqBmKSKg8uNIu+zeXTlYeThVrP2MhZ
         iZPs2LzfxJahPxySh4cZMztQgc6EYFDtLA2XAqHsErln/3lXPG8dhYRodRijjhU8cMP4
         kvLZbgJFK9Kwka5lMD5rRg80JS5jyvKYAVYnlbr4ELNxCRz/VG5qEX8xnpQ//3TX8WtQ
         me2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371611; x=1789976411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaTXnOlSU95/0lAYOwxIOBn4WHPGmn7hvZS8u0fcbvw=;
        b=K5zx/kmZYPAb8mhYI+p93e/2PkfYwXRit/csAeQedeafhYuKxB5+s0u6AmjFGnf24p
         cjWLNJ+SJim8ACIzU17MrlT37FjYyobMHfnck6Rwv3+ArGCz636W7tU0YSEjHbj+5DJR
         R4aASJMHVdSSWMdceYN+JCDve2qkd7c9v6M4jm9p65kdp/anGc+V2AHr6rEEKRJ1wn63
         STzQcHw/XRYQiqD5/hmWwiyrL16C6yPgjoF6IlRsS9CHX0HTMEHPEqsdqXCp90HWeu9F
         E+GwhutzoyNUwyCPzVPkgcUKY82n8rqJ9zd9OZerNc4PXECkUlMhjzgc1noPxFxL/Kmg
         mN1A==
X-Forwarded-Encrypted: i=1; AKwUvBwyiYgB64NALfG5WqKPX+5G7u6706x8Si1IYerx2OswO8dZnpFKLgrgh+1q0U0oXu0nJaJlxH/B1tzuYM7c@vger.kernel.org
X-Gm-Message-State: AFuF++lVpXt2QbNhMw8KItb2G9e2Ae3+vLLZqHp0W2rN3j6/0DxXq202
	ej4YrPkAdBFgCh34NlhhOiOJZCcx3FCHWj2iGVEKx0e6kJNiWn0BV7purtFyT4j00bxT9f9S1qp
	fkoXj+e3yiNtenB7q7FUp9rSQTm18+c3AxksjbmBEjR0SYPjBcRQEsCD1OsE8HLgHYUpxqWpLv+
	bw
X-Gm-Gg: AYBFou0N1+5wQ/d5rZR9zNCICofJhxnhGbWa3fo8/YaZZ7tVebZ3Z1ie0aSZ06vurnj
	O1O4ilT6rR7YeQ+E814UZluixRH1NZsf+hWPuIcmt1Bcib6mNiNs4pV9JI8ijsltMdYlLQi5LT4
	A6ttrh1EgrZ0pqqUc+ROX4mnhiQifQmjjKKypdlOYlQV6eieEUdisxxHMckc1sRgPs6Ulc5+lua
	NquoxxIB/bTag71iVlFAQJdIHGNy4Z7iOu/uzz5snMMMFxUUZLb+yaC24phAIWst38ccmpfxbTP
	4jO8/AWethqJiho2KjNMkgH6OyHeLVvvDobmEYXyQTG2CqGc8dx8yjW1HN7Sn2J7QWkKAK5Kynb
	joX9f+xVCGCil+4M=
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr189892385a.7.1789371611233;
        Mon, 14 Sep 2026 00:40:11 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr189887785a.7.1789371610633;
        Mon, 14 Sep 2026 00:40:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm25215307f8f.28.2026.09.14.00.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:40:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:40:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 17/31] arm64: dts: qcom: sm8550: Add domain idle state
 names
Message-ID: <p75o76gg3s6sprmpq7b3wlzrx24nkt55d6vwu4a7o6b35enbnd@4q36as3j3eit>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7k9jGnE1DM_PGG0De9fQkGqA-g9seCvK
X-Proofpoint-GUID: 7k9jGnE1DM_PGG0De9fQkGqA-g9seCvK
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a4db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX1sbaHqs1DXIL
 xA1x31AubKTSXZRx7Ff6/nKvSJUEIYWuZGQPDEgPYkDH245t/VUFAfhCAxcRSLjOraS/mMxneOW
 x4MNCuIaVX4J5GjHwMfAnAuBNFvrxQKQHLY2N+HvkKQBJj2VPZS8Uwl8XduFk0S+oYaappsAu3n
 F9XNxSICEulIzYhtnZTvJOKQ+tnggMu6lmUZGFHL57weRFPJNZXul3P649ty3TbpVPoGA2RN7P+
 otppueOjJmwiooVmqKWYkOkj59VjKrS4HFp3o3vxYKxB9y/aBEVCw7kUtNL5bcuB66ooe4fWBu6
 nAAMhskhIEvDbwd4QYGJKonLDB7HD4RJPUaiUN8fRGpjp9JC6mMxLiun9l8n5QVBnQHBFHc+7gh
 6lu2gBoXHSluqbCGc2197J3IPy9WJ5aHAL86xaWQC5vmfO1xfTIPZBMSuioliuJWHjXlfPKWKGa
 l3QBt3VimVLl538AxBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX69mn0lSnKnd4
 mxpmD4xZ3bPbX+g6y6w28MHjlihvnjTmSMLzDrFudtEwKVGTQTS4VPjmGcBW9O6lWPa8/3bE5lN
 uarrd3Gesjgw5SQIKoeGfKwyBq439ZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:49, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
