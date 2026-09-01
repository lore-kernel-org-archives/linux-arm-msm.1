Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B83AAF6E
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264750; cv=none; b=mBU4aNBxQQ7ORddiku0rOfnMEfkr1+jKS/8iGVx7Mh0oDzS1bbmXw/bzXvUHPLSPaRg+zLDLUuR2pp6yvr/LoJwbJPhpLf2iMzZE8zaJOfShXU6J42DKgRS2/m0ZBcqhrWnSD4sWWcQnND53Sydda5Gidk4la7VE+GBB2521wf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264750; c=relaxed/simple;
	bh=A9vl1r0BI/Zpir37RB8HZ+kyhB0NMu1J6OC04urDuPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+o95PKtpukZxrJZKyBneAyI1RpLufJ89TOT77n7N9UiPi+a1Tg0pvAInS0VqkvqJS36yjCnHYa9kQ9xTxXuy8HSmCn4Udqs7zizh0R6Stbl23+ldS/RiaWPAJpwB6NYCe8S6u+n+sFGwAt4rB6ofJvq9Ls/D7Dam/vvSXTf1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzpQunau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5uPE/CW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzpQunau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5uPE/CW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJjfX2752224
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KEYrBdhOrwPTRM2hkx/oQbVx
	THX6TdT/1NG+UteDI0c=; b=CzpQunau48fyjiECCIjdPOsAO/0tTqwBftvpVo4a
	qeH9dhrpAzMRxvHUUesCOAuVbAYhrKS4WAqaBjkr5nKI07F30rGWV/npjY+D8tWp
	Ygxb7FY+PFTY6GGxns7QPKqjkc1jfSYMW01kNMYwaCJP8hieJHeOVwPcfrLhid+2
	yHdesmt6zg0O2lZdECU1C/kR8VMdaCxAmDDEkwCC6iyTUcnS8Iw4qfd19DSvmNUa
	JEX8NpvL7XKVEw4URParYBrQqVC+8gvz0qaifI19NhpqLE7IYNkV6WYz9NrJeupE
	IUa13gsk3/TpvY0iULZ/cBQWEbmAcQpRzlBwu6E+9M/ejA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbuea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:12:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso619755385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264746; x=1788869546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KEYrBdhOrwPTRM2hkx/oQbVxTHX6TdT/1NG+UteDI0c=;
        b=N5uPE/CWeDHwFQWw7PSEc2+8izReiN3yXpmU7i8YRxNxgLEo9crviYLg+LYo8wxNRc
         x5kpB4RKPLFdHvxFBTWyMmaEOY+7XCZylWpVlBfMvivuYMhxyPZL0KLFs/VWoBf9NCHz
         kFRT+eYiTazC4JY3IJVwaDGhFoDP8NDL85LMYQW7uDpvsg/GWjs6kh0ia8u8B/mmZYEi
         7mQjwZAYDj5I4BcJ4JjMCdtK9If4Ufpfk1F+pou3FIdbCVsZKOF7PsySNiPJZDfzTDZW
         KqmxJw6PJW4+POPKLFDtvLl9cjMmZYZOttw+1msD+0slYWZFySkILusjR1cfZF5NQX3s
         aX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264746; x=1788869546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEYrBdhOrwPTRM2hkx/oQbVxTHX6TdT/1NG+UteDI0c=;
        b=LZlvDAeHWwv5bkIcDUFRE4L0CmzlasRkGuYsYqlS1bA6BUYufotoyu3qkRa5+yUNJn
         ZHQQ4OyMM8yj0bQdG/UlyyQwb0TRxQi88FbhiIRxaAUhdg5v9TD9WtR/hWxXc1DeYWrS
         VztXKZ7XmRsUxK0iKSGMm6ZViGFMmwERZdKzZ0rQsCN9SeYdomXZZDi5RtvKaecZKKGB
         U6eue2lzN1EUBvjhNwlqw4fgM0IJhWvAPDR7dBGu3SFu4IR+ialEEmFsjnITm0WYSg5b
         GNdvCMc994D4MT9F5Cu552PtSXRs9aWCgdzjsVMffFATFKHPROiYUV3aEfh1ADxcdOD5
         o0YA==
X-Forwarded-Encrypted: i=1; AHgh+Rp58kzK2jMGUDKZ3Ah7SHsNdsLnGqfm60BCzfDMiucj3CExFTa1DStUccHwJebifEYLYGZrj84SoftdJurV@vger.kernel.org
X-Gm-Message-State: AFuF++lrbkdiUcSAXR2UcriFxPWpHBRBfAONGsbhsrXOLw564gy6BOUM
	7ABp9Ge6SXmeDcgYGVXAJ6PSM1fE6pj8/VTFByosEqGbUlec4MQiw4uSKYk9dVna5fjdx8k0fYN
	TrGHIFrEuzAsfQJNgS7AeGLP+N8KD8ak6Ps5XZs3ZLsZL9oi5zH9YJ8ELH7Hq1uSzqAsl
X-Gm-Gg: AR+sD11jsERVdYmG4LvsnfAUdMP79u9+U2ubDpGgwWTqtuV7KNEaIh9TQoVlRKZ93oQ
	Og8x3fKjVJxv8Fvn5KpcbhZI6FsclK87N/waptbfC+7ULHQzacLuz7uAAs6agJGwINUpUJ01f8B
	FizGcIXBamfHCvt8SZwd+TfXOVJoYWjwQdo2Rh8KupLnP0J/0IA4uPxTbZdBG0F1pbjy1v8286/
	GEGJqwUdCmnj79LX7EN3k3AsRtt5FZJxhkRYryb24AqOBsscdYj0sjrHjG5Zw2UNGV/2hNwaP01
	B8MPZ3dzl0qTEMgtIK3lilui8mmLfXFYZKAf4gHXhyYmSBb46QTD2DfYIQWlmL1givHDyab/t6+
	GKrpWNaylccpX8/k=
X-Received: by 2002:a05:620a:1984:b0:938:39e7:725 with SMTP id af79cd13be357-9394815a333mr973253385a.32.1788264745653;
        Tue, 01 Sep 2026 05:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1984:b0:938:39e7:725 with SMTP id af79cd13be357-9394815a333mr973242085a.32.1788264745018;
        Tue, 01 Sep 2026 05:12:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e3a9sm63700565e9.15.2026.09.01.05.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:12:23 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:12:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
Message-ID: <mf4czulidvunrfm6evxvwf4ds22jcdgn7e37xnhhakw2zrl6ug@aenri3zg742i>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N1QeNKrFaNz5TUSLAUoVj3YITl9p2t02
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96c12a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fNEQ1mXMgSVCMssgLcsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: N1QeNKrFaNz5TUSLAUoVj3YITl9p2t02
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwOCBTYWx0ZWRfX0A0Alei+pL7F
 Cw4HmY0a3uWN7u8BPZhbjl3Zqw75d1LY0ku19c4GgOXPtGdP6fak8+BSsZu3WbO1gmCknV/6G19
 jv00sxzvZpRS6NyHvL1iMmDvZmuAIxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwOCBTYWx0ZWRfXyENOsX2SoLVM
 il6B1YORv72bcFv5CEUgVdfYCBk5iItL4rTDk9JACN5QhXMaNTy9oaQiNs7Y9PuD/V9SyXJgDIi
 aOYlcCfiZ7/f91HmyJ7ThMrpQhUXjKm3BMObk0XSJG7xP1NUjSlmNNXIwaJU0S1DkX1Zj03nQ4q
 ja3m/e1Hxd98671jHuVIgbhW95BiCKxL5+Sf8hg45Y1avgObg5NxoTuCRGFv9rmw2MKEU38UQeR
 JiX/wYjc8atG6yvn6j04984Dt8M36IiAYT1nEujkZkb26n/HtfI3/fW0llYJrFP9j2RDEb4H2Kh
 bvxDuJ0meW0CEP20xL2Bxf5PVkpglk2SQQnrBbMUywjY/qTc5TfEt0aYrkaELXgC09bT7fGxAQk
 x0KGBp4ddagz2WywRWAjasV8xeFJzM50SsF+8JpnnYzY8sFZd8PVWDBalW/MG565KCT5tmyRzHx
 hXQrWNYJ8wVusmq9AlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010108

On 26-09-01 17:50:55, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
> are identical to sm8550, but the sub-blocks are not laid out the same way:
> Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
> everything else where sm8550 has it. None of the existing offsets tables
> describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.
> 
> Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
> entering and leaving autonomous mode: it now uses the real AON region
> rather than falling back to PCS_MISC, which is what platforms with no AON
> region do.
> 
> The offsets were confirmed against the Nord register map for both PHY
> instances, USB3_DP_PHY_0 at 0x088e1000 and USB3_DP_PHY_1 at 0x088e4000.
> USB3_PCS_AON_CLAMP_ENABLE sits at offset 0x00 of the AON region with a
> single CLAMP_EN_B bit, matching QPHY_V6_PCS_AON_CLAMP_ENABLE and CLAMP_EN.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
