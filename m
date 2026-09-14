Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D53EDAA0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371625; cv=none; b=e9jrTMigiuWxLjFFb83iJWbKMNMM/uhe5MSAZ6ZVA5YQNc8fAT9YQ8eF7QxetE7AT9Wd/d3rw0iB2MryulAU7yMLPKYlSxzhTKUwp1348HCAlgtNHLYbUcEAzQLNwC0HdiVKeK0Eoq7UYHT3vjxp4igq2bEr43nJmBsLW7VFJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371625; c=relaxed/simple;
	bh=ghXK1W4D5whbR8SPBbaqvXVAbzeAKlrM1E+vk0N1mq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ulc1AnG24jcYwnKk5lJ1A1iKuPz4j0Xejf1fDH29nlyS7wv23JXFhMvNVoVpmGZV5NserdA4DO+U47MKhN56RarDpCTdsDsdFo6jE+cWtCy2ECcBgLLObMrfzMeAvZH9mnUdhtH/1qn4TSyTew9q8MvvWLcXBlhUtBQMWkrrYYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXJNAud0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcwKMoGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXJNAud0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcwKMoGI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSqk237672
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PWnct1xCSH3LSH5yvTj5UYkb
	NbZDOb6fZJReyuFwq64=; b=VXJNAud0KMuhaQnZcXrJJvHKLxSRmkeoj+TqZzRJ
	OfR3LrtKihuiy3eCXlEAzozx7OzkhlHi3us+LWxsO4BsAGsnDq5wfha9RK50Rd4T
	ZlH3hdClwaOGYp+v+TBpu7iMjCMa1ZHZGjcKqerBh+QNNlti73xiGAh/Y8IoKR5K
	rPehzNj2sfgHoVlPm1TGd3y2qmbDMIbNFzJ6NqeoITxlbCoSt2k+sna3LBW/pNl1
	baHYzK+3QYZi8RoRnof7XwcovH9556HRaupRxFSb6tm/46q5aPvTHnSAhlruRrx7
	sm8lSptO/5gxlv1EHjOOHJ0SXEtd1Fq0urfy+g9EyB6rtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso504478785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371622; x=1789976422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWnct1xCSH3LSH5yvTj5UYkbNbZDOb6fZJReyuFwq64=;
        b=kcwKMoGI+7S1+TZoFU003QkizicBASZqwaVbgIDDLiayVPs3zhgpFFMhLY3uVT6fTG
         H5rICgvSo/b3f1jSoeq/hT8jfhthENnVyhdvBrUoh1Eku4Z0PKReNN0P+ApBt7s8f860
         quNPmEG/O/FuZbOtC+6Fpm48hqbuSgg86BBBwSdPqUIebfB50mqeZsZpOR7qcz7Sx2dM
         V6W3JBXLCJaGXNNsujxn5mSZNPVcj8L7FUy8a6XzoB6LGsAO3Ktcnk5Yh7W22gpoum4H
         +EXxCSHgs0czkttGcvty38bd8cuTzBKVum//iJzvMX5JScXapNwspcogQ4eFoNJhHNJT
         19zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371622; x=1789976422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWnct1xCSH3LSH5yvTj5UYkbNbZDOb6fZJReyuFwq64=;
        b=IF3t957WZcV9c0EXsX9UhvEGRMm6YLoAZaF7dIt8g8ImXW1d/XNHughrthawqeg3fu
         l6aVpL3FCT2JxsqbnHPc+M0TEZXoxsJlOeqxRbOOgptKozFkwc8AD0EhbNcoAVhKb3Hj
         Pqo7nib5xC9BG74qLt/X3fyH1YeDB5BfvP409CxI0BgfbYK2JoAa34gFYUD+BQueg0tg
         TaxMQ/F3sKZyiUarCfOLRrj6xwWAggoVnY4vRQ/GtUKGp4O2i+AKGMVKJe1m0AOAAR2m
         pM87utHvn94kh7FtnlYm/7TC8rkVfmcCkj2ighMDs3eW6sS1Yr4Goc6swVGzWbP9RWNO
         es3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzq247K2iGmeII0DOz19fBtMmfK46pSDlEq53b2tFzTsN+1LrXH67I+eOvEQ00mBqJXUnTcx9zVxihJ+7Le@vger.kernel.org
X-Gm-Message-State: AFuF++nAkC6OFKlSMMS98aeo4ud0v6zNSUCQQAMmc+Zp78EwNqPG3C0Q
	ecEqm+TZt6U3Oe6cdGZwFzErtbCnMyhxuY+lOVFdaHaX+kwfL7PwUHdH3fxty9jeDWIdVj0YR5t
	ouR+I7LlSW0xT+jhSVxK2nAEscdc/RkmO/3XDNFru4UGgO7aQ1bB6j51xvb+TR9QbLUQt
X-Gm-Gg: AYBFou16OyyUtXZrjjCwfE5CIYRiKm+VV+X/e9La/DUd3B8Fxs2fFOivHINxy1T4E7r
	hkc/u1tvZsm2vsfGVofxEjShIM9V/5vSkbd3lDLO+/scD607kfw5uOWAmg3dcfmtM5vPML0UQUd
	ToRE2Ou4TO2meoxAuD/n/3AXakQX9lYYRsPT0NPNCLLHNnAIJlrctLBfuG4ip3mGBQ09cu+h0xl
	FanNE4QG5O7udwOMd+NieVLhTDqm6z/XtuHf/q/QPFzJAUeyf3JjlJ1oY9dmU8crkTGyNhQiQwy
	MZM+62Y8glq7FBdo5TUpQfsFz9sOshzMvUQs7Q+yXa8xv2kArmKj3bYWiGfM4bIDgSyiFgOTRQV
	ShQc+0eez8LIy9+g=
X-Received: by 2002:a05:620a:319f:b0:939:6dbd:de57 with SMTP id af79cd13be357-93a299fbf06mr196505285a.32.1789371622048;
        Mon, 14 Sep 2026 00:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:939:6dbd:de57 with SMTP id af79cd13be357-93a299fbf06mr196501385a.32.1789371621465;
        Mon, 14 Sep 2026 00:40:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ad0614sm318424955e9.10.2026.09.14.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:40:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:40:18 +0300
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
Subject: Re: [PATCH 18/31] arm64: dts: qcom: sm8650: Add domain idle state
 names
Message-ID: <dt3njguunm7djcf4iycx46hhgwbky2ajshkaul25geruardx5g@u2slpgmakwdo>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: LKoSMCvwv4IdGC0cKdGalaPB9HnWLvhk
X-Proofpoint-ORIG-GUID: LKoSMCvwv4IdGC0cKdGalaPB9HnWLvhk
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a4e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX/CIClay7Xn5r
 sYJLm0l9/mBVBnRkD9NPKg4SYYcxKP7yc/jtBsDuMQQOlnlrZdlJMKI5tZUfYoXeFvYYiwVlRQi
 wcdSTNI2UzXde35Rqbhlo8TU1EDapOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX5II1AWFMCWN6
 DfDwJ8wiSfekbEmzoiCHfzntB5Hz/L1hmHOJau03+5FeAlqmUSQILUc5W4ChCo5kf57aik5vqWC
 Q6SUAvOKTiEfp/HwprBg4gDeQnHagASamC8/jHX6qnHIDVcifQXfgD4bIhGxsSaMHEWm5aX4eGx
 TSnRWS88DbB7LV4mN81OA5jz0S5b8iU9l2TdPaLIIDJSznoGgQfhpM3ZkF2nA3TNLFMM0hf2hoB
 WeLecvB8DW67px4LRWskPhulD3nW64mpixv0KO7+sN5dmHdkgCFO1t8kHFuow6+DIGvTC0/ekiH
 GU/gBJxz/5cTibAYzUTtiaTOYhqYfYcQ+H6d6Mt+Ay1AKU9sKOY2fme04xO5nAinUVKWTb4QQJo
 hRZyE9EKHTuXQgN3iYJUv7qO8lNX7h7OhoBN0ngAFMLTQA64WbhwvUqDvXWpfaO45owEV5zRrTf
 ARSTerG0wOkJrTTntFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:50, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
