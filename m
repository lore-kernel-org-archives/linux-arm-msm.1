Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F63EFFA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233778; cv=none; b=b8Ng6aKHc1mj0fX94SnuNtmosd4W7zNngeD+p0m+98i3rQIwUoUxrYR/92SBgEXo/bXbByQ+/BPkr0k8DWjJIUkBUnvh/0PdWP2IIG0IOFdqZAMd6V8yHaEQZUcmnvweHFmLkW/Zbrl/Y1T/thrFym/ILA5gxkxGmD0Lr5fcspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233778; c=relaxed/simple;
	bh=9B2krtCY+MxnHsDNals5eAEcJxuwJx2cjjHmlvlv5Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXUymmPCH3DUFdDCGK1Mostp3656eI4U5o1GHyAM8YpQOOtbq6CopHT/sdjm3JWjy6RLNk9zDaDxn8muuS89xaJUvJjmzM+TWgTo4DdU7Ru8r2rDGR3pOzadOdlWwDAak5SNDyxB8HHaimza0lpN1ZyKjSblIaqlwKM7gYhVmvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4pbpWjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx4S99RS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4pbpWjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx4S99RS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBdW4147328
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQIhQXP7ObT82EVVw2F0DwRt
	jw2CrGVeAmf9ccNKQ5w=; b=j4pbpWjcVTM7h0IdZjwqCkUwN9hul/WbjLUQyaG5
	RrEoObGA4t2uWizjAInxcdTCVG7TIJr2gm+N/KSe2XqIqUVwfjFxbFcfVk1vRwAD
	sdt0CnWAumwr1mmc2JeJsE8qmAOkOUKNusNp5e31LjgLlbwZyxvZNTeK2i8YnQmf
	vOnoNW78CfdeH7fGk2pXd7GrzNvF9u5OVgb0/hFt4OR6eEQIkWZDKPeBye1grpUA
	Z35HqeIMIPnWRl7RUzk2TohRa5rlDI8fPQ2uvo/oCXzYzT3m2hfWTaABsr4xKSTN
	W4WYc86qT5hTT0zCV6khzVVGm0LfkKYO2CweSLLgtYhqTw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv3smj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:09:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so2814077eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790233773; x=1790838573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQIhQXP7ObT82EVVw2F0DwRtjw2CrGVeAmf9ccNKQ5w=;
        b=Vx4S99RSHgJHr0uRAxOHXMp3DA9nkAFAPICfKVBrkkS2DSeNfwYprTyPeDxKEZeCNy
         cWEttz8a+XRy8Eaw2s+CmS89bcw9cWl85t+MyGIsUMzAECRyQaoIeyk6SYVMewbClUUu
         hXJYeX04mI9YuN5wlKCN0RfHhDUvk6VLA046zRqwkJ3ta4IFlrcDBCxlYgV2+gplUmux
         WhvbiUZYo48sFQe21piVl6kqBpptitit+quIc5gZUseblMaPRqgwja+VIUo9wd+F08ru
         If3mV8i36fZ52Q+D8P3odHvVSW+kjeBeYDvLZK2sJeofnJc5uPnGOSr17oxDgRyr7SGM
         n8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233773; x=1790838573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQIhQXP7ObT82EVVw2F0DwRtjw2CrGVeAmf9ccNKQ5w=;
        b=om5KJjVDzgr8rfXpz0scFR42ImKdnycUpVW0Mb7XIiT9zw7I4kELzmJBtbKDyKAOeQ
         WWu5MuC5BxG09ldlGGRL27I4oyL6vPST+kF6rVQNzqFQJ+cZfYTb7PaHUZU8cjASz8IQ
         9zlhMfQiiYcgN/6FrR0LQWIhBngOWJNvknrhUVLuBgAJFRsP+rFqjalr10qJFUn5Fg+b
         TeEDCEUSDJMgR8xWRQggrUfK0nj75DrmCzVVYlQ4BXbSOuquZ6ki4VDH3AOAkWXeuPOR
         82WEOf6Hl9xYvO4L2fOtW25hy2dKjnIs1tBQbFyK9+yq/UBZqP0ZiUiPSIYudZEjdbQz
         LI5g==
X-Forwarded-Encrypted: i=1; AKwUvBydfNlf7mG0pe6qCqljrwo1uZ8u2ENKyEkAV2A05hmVhz1qWvGf7kNKBsDEYzJDisleSKnLbE1RgiiH36dC@vger.kernel.org
X-Gm-Message-State: AFuF++mY/NXsNoHbdH/86X/Y9/Uxy+RznL3ssb4EJrvYu1KaIrNxvzs5
	eGJ6z0hk6w+FThZX7ZRbp/bkOPzP//cxXRw+Poi50t1wxjevd8uIV8CSdS/0fkLI9mE3hI81fhA
	esNjDEJ6O9ZmVin0n4UJW4068btgm/wc3YL8tUrvWMljdM7m+GvgiCpbsOFyZKZLXyav7
X-Gm-Gg: AYBFou1Jdeq6aAy9u4ROGPYtLsV6YlaUd0cmW4uaa/keV9qwXC++O+ctTxwxhw9Fyix
	1wy8j+60Jiv55w/XMH/0hPskAEZfxHmkCpCFk5ux3Ajlbo/IXy4UCm9d/8z+r3/vwQbP8VfMp6h
	PQCD2reYN8TchnLTnPFkTgMPsVIVuZ9ntOtfAf7uPeQ19w6v0F/bUxpyUSjk4AB880jAkm3j3k6
	PZ9I+iawMOBy6avTRt2ziexSBKdDA5r15iqA+92GxaL9htbo+FXm3xxLb826wbeSxDLX2rqM7Ac
	zVwXFwp3Kr8UAf/qiPdQb7rETugRc6fHFdrllv9oKa3xVXZdy0mt98w7ts5m8UScLE/b5L6ufwq
	YzrAmcPJqfYefISJogLG9EGDR2FXRwVhep1dFZLhzYA==
X-Received: by 2002:a05:7301:618c:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-340062720f6mr1228289eec.20.1790233772677;
        Thu, 24 Sep 2026 00:09:32 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-340062720f6mr1228257eec.20.1790233772034;
        Thu, 24 Sep 2026 00:09:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96952605sm11525410eec.22.2026.09.24.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:09:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:09:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Message-ID: <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
 <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfX5afg3F+8H9JA
 kxzBdZkr/HdHpJk5ypvUvJqASUR8NfbVEBckFNNhN5zICtcd+P1tZXjJHnFXjDpxSKuKBXj0Bda
 JqQ1v2RsRZ9IAgL9uMG2rNRW0iGPrMT9wj4yUtQkKqs4hnjsTEjjW96/MlAjUOtVokVgRl9dbFR
 WzIBobmt36gplTB6Wvo8mpjR9VNhWzlofUlSuAt9K+Vgo9HqUz22ZP3expqEUVnx4qTpYw4jdsT
 kSYYOYzvHiWVmkmtDosTg5rJc5trGTeGkXrHS09Y4DLKYLSXgCMoPpJ/6rr0HgPPTmV6/v0/PZp
 pgKodPhxtZqqElOq8V1YhGQo6OGlBIRaIiDRcmUHRyfJkm82bCesefZhArL5w7RI5aluR4uLGvu
 c+AjyFtylscEiJQlqkrhkwZ9kqEEVs/xSYSYULMSg37TFq3s1oPRSvTZWhKjzlVOAwxtDECb2Sw
 856auzdMgMJrJKUn73Q==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4ccad cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=jaWJLzSDDGsGEjwdg8sA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: DGad-uJ6keVSjKOlmKemgvH0WSFCaTDo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfXwbIsiks4ytVe
 3l9wVPO6/7dlb49O0K8n0/KbQ3+rqhDvFh+c5blk94ag3uuBn9RMv9GxmC1LZmJapJkM79vPsgk
 d5/1bBpcyB0SqzHn7Fy/3S75OxDjJC8=
X-Proofpoint-ORIG-GUID: DGad-uJ6keVSjKOlmKemgvH0WSFCaTDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240030

On Thu, Sep 24, 2026 at 11:52:52AM +0530, Vishnu Reddy wrote:
> 
> On 9/23/2026 7:17 PM, Shawn Guo wrote:
> > On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
> >> The nord platform integrates the Qualcomm iris video codec hardware,
> >> which is compatible with the glymur based iris implementation.
> >>
> >> This series reuses the glymur DT schema to accommodate nord iris
> >> support and adds the required iris device tree node to the relevant
> >> nord device tree.
> > [...]
> >
> >> Vishnu Reddy (4):
> >>       dt-bindings: media: qcom,nord-iris: Add nord video codec
> > The binding should go through media subsystem. That said, this series
> > should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
> > patches.
> 
> Are you recommending splitting this into two separate series, one containing
> the codec binding patch and another containing the three DTS patches?
> 
> I can certainly do that, but could you elaborate on the reason for preferring
> that approach? I'm trying to understand whether this is due to the expected
> routing through different trees/maintainers or if there is another consideration.

The routing is one reason. The other one is that the split will make it
easier for us to build Qualcomm Linux topic branches by pulling patch
series from list using b4.

Shawn
