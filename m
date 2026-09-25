Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78448A8A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329701; cv=none; b=Pj2rTRjM19eGZC4c07CYtGhb4exec687C5U5EioJSCp+hD29ioQjteGW997rV+t/wgC+Trjz1mZtShNQaCHFJC/nMNVmUzgt7C8ObMjS3EZWL8K2vsMQjkEwpKm/uLW6qhLgVKsqbVT/+jqRRzYtUdhTr93761Y+5kSqGim5mZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329701; c=relaxed/simple;
	bh=88IX1tmHXms+pmBDY4fQ91nC5iyYvEp++1JbnZD9ebo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwWjsKImKPQ07hTxOj5vhk9eZraK+K4jYheszY2mPgjNu2YOG6pn/Xp4MtFLCdI9/jtf+NTrxxcdkFaN4eS1+5TcQ+upJkUF1mDokpHLj1hzpEoIJ1yDnljQN8IIokWKjUE8tbY0Tk2bjALJq+pNtXsO48Pb7i1T1sAZpO//H3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dse2ZHvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNgOG6Ku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dse2ZHvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNgOG6Ku"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YeGx1193864
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKpKeKCtxn641s9Sq4IOPtWi
	CTENHPj6K3Ie8LJNauE=; b=Dse2ZHvmbRwKbQP7R+1JgOqw/uBIw700fb6P7xrE
	ddICyVpmtmwVTC0x6X3jcTqEf1wQp2D130IE0unoUC54pIPv9+eIRYW20gyenzLh
	9kUvJOJltqYj2j3r5RBktiMtXDaGB/JDeKKGOHovw3Ot7F8bqVi5Hd4zs9FzdUu0
	IukVBdq3eCM/vjYByd0LdPj90YDHoFeYFvn5bYaAkKLv8oAbV4gy7DKdfnVb+CzZ
	2qc0erk0CZpX2ApbzUWtNzL1WTuUQnbnE9zVtW3W3iorMW1hE5WKPPkVyhG1zG6R
	bU3YnPYYdeEihgT9b969GZNHyn6R2QgJj9kWUSwDM3PUsQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jwtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:48:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-912330dd4dbso29263186d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329692; x=1790934492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=NNgOG6Kui08O0Ir6IVebm562Y1t1OsoOTzfAAca8tqPCwQse8qHuxU0rahl2t+V/pg
         gwcm547UYOgI1OAzaV8/D+r4L7QIPi7maXCp4das3aSZ7UU/j+BSftGvz5+BXrLws+Zl
         9rQ271FuBdM114BpU1rAyet5D0buN2PsBQo6Adm6KvFg6r4ZXOMJ5NoR7aAUNXpeyUox
         vSESBKRaaFZBgxzSzb2M6GTj7x/5y7vAbvtJy9ArAM75szpOb4vr49aatxJFBz1OcQ4x
         cuitoD2EtJPQCgIW4ARU67QEXKirWKCxD7oe/UgdG9YpnCytMRe5cLmUJMIY0kH1dl24
         x+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329692; x=1790934492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=wsSEuhD4J54h1DBhrNtSO3hZFGMK+TW/lKG8gnh6jHEbF70VnUTDO7J8mqT+cOb1li
         YTKLyIIjVACAdn6j4OmZT4yM923FufIMh7mggpcqWDM+RVfdDpOO61tWM1GGi6JAbWMR
         S5E5ywwQ+20HRVSK7GVAUmw4XTUr5NV6MkFhxbn5w7bXgYdWzC/LlvK80LNIgybcyCF/
         fb6RkR6eE7Z0S3CKQznx1HYEtkjjvDNOK33DpVm2wG1SrO+2M9Khe3Jl/ZSU5X7aOnVx
         kZGDTkYPnrEqBBUoFoTAa4f5Qtxr3VOVAFtR9/ZIKKvR6LxAm/3QI/rdtx7zihQV9HE2
         2JIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFXT0SeC14ZcYFeIN3YaTsmlx/ASt0sXUHhL5ICch327KsDlKLiBYs7piagvb5XkUYhweyoC0nO2F+lJIA@vger.kernel.org
X-Gm-Message-State: AFuF++n6rJ5D8QzUuu4Gkzz9a6H7pxaplCwNAam3Qepp6LQAO8VH2/M1
	vpDj3nmxWxProLKaHqsdD5QKU9Sgz3g8bzTeK0YoCn6kDs99RE9gk3Ve6C8jA5SqHzFu22/oriG
	DOcI6xi2/IEel7d9/72++mSSdRQAwh+jtaCG1nme3/KB+ULQRmXefkT4AsOJFQdxVplnx
X-Gm-Gg: AYBFou1FQ4LcHutsk7xwrLWybrhDnMW2jgy4z11U7Lqdx2KC7jQcv+ytCSVm1GMi4V2
	1IVTp/z8NqdavJ3dLS1axuEVoqrldBUkOiqyqU83Y2PXGdIgm6x+7cFOooOBz3EkVMDiv27w9oG
	8LPxb8gWCLWSs+hxsPJHqhrMvSuajBvhKfGwpWnZUpqsVYCg/nyd+tYjc2/i1EUhMmXtv5PkcOl
	GQR/z3fkzSs7jkeyNKHZKQTiWxDNXUVGFgyppDIWGRVcsH5GmenUD7c+t2cdpTC/r/QUYzqlFxS
	OLRCSOi0mphN2VzfvYa5uqljYzehqW/UGaE2rVKyZJ54uO82GhXmzwGMfkm/51sAR3Ed+BDHijB
	IUBDPGmxIJ26BL1Q=
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347262385a.15.1790329691547;
        Fri, 25 Sep 2026 02:48:11 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347257885a.15.1790329690987;
        Fri, 25 Sep 2026 02:48:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm29134755e9.10.2026.09.25.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:48:09 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:48:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <nwpxqyjjusepqubva4hsf7e2wfvvigz22p7yp6c2tblezz7qj6@2s2tmiggu2dw>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: f1oIuT4zNvF0yaZn2dgbI10K1qPKZdj5
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab6435c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IINBPA3gYupw0c5GNbcA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX08MbZpwwPRH+
 N8e4Z4CF1xmuLips8wFJ08Ivd+ThIor7jEQ0xL+EJQS3jPvB9cFymWY/cD4oq03bCk0K/0QX/y9
 etlTpuhsOg/ZTXjXEu1eIzsvoepSNb4KPiwLbSlCNgx1AYylqaNO96tDCcOvSAOa4Idf1NC6TOh
 xfxU58lpXPw/Jrn05g+bDGE8nAR6vNaiTxqCzlr1rZOT9n+ILMfQiJv0+hxgfOWIpIbWMnLlYZb
 tVno3jOsdSyuo1ACR2CygKj1eks2ZZsIKWoZjxNkTtihSr3DAjdvhnBURuOYcQ+52J2AzJUQZk5
 LVKjPebqWrUF1Wb35jpBJrFXnhDEU7lFEaoTPwV/cUFQ68eqgulmBSOjP5F803eYF4aG8XagJE5
 9Z3jj01qQFEIkLSeGgnkQLCSGWOuibM7RqfMdNRyveHFBDfDwpW/m/E6MKUowLronzGtBg2sbVz
 rjGj5QHUzAGlAMfYoDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX9UCilEP7/FU6
 w9p+zjSP/cwDFw84qFQPsRsSLqfbfOZljdB2qCkTpbUHcPzKJr4IKuRtYJVoI+SXgHYAOCEgR1F
 qlinauYcaencZ5CvKcXtX2nxqHoVDSY=
X-Proofpoint-GUID: f1oIuT4zNvF0yaZn2dgbI10K1qPKZdj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250038

On 26-09-25 00:11:51, Shawn Guo wrote:
> The videocc node supplies only the two XO inputs. videocc-glymur.c
> expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> parentless in /sys/kernel/debug/clk/clk_summary.
> 
> Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> is listed in video_cc_glymur_critical_cbcrs and is therefore force
> enabled through regmap, bypassing the clock framework; the sleep source
> simply keeps whatever rate the bootloader left. The orphan still blocks
> any future rate management of the video sleep path.
> 
> Pass the board sleep clock as the third input. The sibling evacc node
> on the same SoC already does this.

Same question as on the 3rd patch.
