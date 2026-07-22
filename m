Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E2C36D51F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687502; cv=none; b=Ghk+wIjuRJ5pyqtfUOZTXdeJuw0RZAgiAfOk72EQiQ8WInSpWM3N5PKKoNdmxCKNtrMJkqCEPWlHNjxLgtVldBEz21oYVefYkLLnP+wnuwZhNsvEBFiLmiXFWnmuy5jJibxVDmg+SpwB1Pi2hQLOqteagGuQMetspYJEMSwFqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687502; c=relaxed/simple;
	bh=GnMIYOAv5bcidbrdOSI/mw0f8NCnfV6cgw/8U95/Gac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyf/xC2+/LwOkhiTnpSKlIZzx4XSdOZm4ZzlkcxN/BWwTXup53BhZsSgs/y5eOCfzEdD2MeGXpScn4yJk5PEERB+dQKl38YjvFU0UKw/HWVXJEIw2VKDUcnONfobDxKFqCC2T2S5EX6vM9wvUUsK+pP+N1K2Y1X0zIFt6rdZIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sl2vyp7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuOTTcPd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sl2vyp7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuOTTcPd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CLhT3477080
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7FEcFIJurSvYfNtxXfVXViev
	9lJcWS1x0OmvLn44weo=; b=Sl2vyp7T23HEZOna7bQEH6A4VugHU07O7RbnTL+/
	c+yAgGOie78VCdoiXLBFtHQCeTtmKhk08WPKDGUd3tshicprBN25tOHujUeKc8Qw
	Zygdv+0D4I/PCTvzvCVt/QUM86uAVr9NRyrrHnsS7S4GQbBgHuTFdLBLeEY67Rga
	jg3I8qD5AdNahb918V7OaNHu5Z2n29cYck6IVaolht2VOdyPFhscW4PmoBCboqnF
	WXcj8RBA2K+lTMJFBBCKWms0RDtdxVWlyKz0brvPu75IVUkyQtXMcEgr0VPPeXxm
	CP87UAKvBMEhWM2E8WbeupMd+O3vgc7+ntjdDrgnXYUoUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d1shx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:31:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so214380985ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687499; x=1785292299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FEcFIJurSvYfNtxXfVXViev9lJcWS1x0OmvLn44weo=;
        b=FuOTTcPd/VhcXV/5pa/GJE1YROZOkFyuZ45j8oelRhozYwmmAzhYjN07XB/oJ1sl1i
         HxtWpNGA61P6VFm8c2/u9X8RvYtx23EGJ92O2EGJkdPN6uPUj7fzKBSpyQ7IHVnw34Yt
         QdyIWguKMhPEz4bZRzV3HIThg5u1eUIwTL6avQbULFeZvhaO/OYyyuZEJJFLbpp4R+4v
         s20JU2EJx6M5Quur89qv9leO+/CNzx7Tgx2prqFJc2+zG9pVasIDIa5vtbZ75tvvYRe/
         8raI/TQ9gWdb9/rMhlJOtRJpHehGFrSaUTyubG4UTU7uRV/KBbonGpSwjwu8MheXNca4
         3A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687499; x=1785292299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FEcFIJurSvYfNtxXfVXViev9lJcWS1x0OmvLn44weo=;
        b=aMwl79ieQy2sZbzqkzJuCM5m+EuqaTPXdG1CV1qyxsrN9cdxMdMVWq76H+YGA04epP
         JbhVhI2sMMJqArA8tZv1lBS10ziGPuY68wEWUQle0hRgO9mVedKxOHDcCnSdU+6/RSw4
         0qfU6xFpu6xOFsD1aCk7aCMpmHE+eSfmItZXY2H0xpLFt/DcX3ZxeztbYGoyX8jjkzIj
         lsUWONp+Q1jZKzA3KTT713jqbgQu3u/98LN8WkS0NjL035E7ekubVrTKoPVJrPml/cyt
         9uQrtIjSuA039Bfzbwpm05xtlj8MzZtPFZ+uS/3JEKdPVoYKfIflaMw8AecuNu3lZb2Y
         q3Bg==
X-Forwarded-Encrypted: i=1; AHgh+RraHObSb6T2sNCfa/Trzs9QBvG/gYylZb7FCQWf4UsYpfTY7EjeN3VS/Vek1/ufQxmYzFe9tUXZm2vsZvlt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7mfmKcSXKeyJGPRnhJ5dme0VPsgrs0LcPnP4phaoXr2IXgsf
	v1H2gzWWCtCR6FhP7bhsHtZ6Z0FRGvCoULZRvZ8V9lCJDKKk1LWX7KfsMCF+BGIUW9MF8OQPkth
	IAZzhoZDVutr3Tv3mUgKOc2wsA0fdYMj+ZP4s3sxuLzFYirN44onirYUEkqRYIjUFcalD
X-Gm-Gg: AR+sD11d+Rn8BKtWc+U2+B/xwQ0Szs2wrVXuufydKDVQxKDNY9UZbMYI1CZgxxNUwO/
	TxkMn6GXfuR9D8ma6KHEzh+qQ4cXq/cPUwsggkUbguslBH+hdMgbXb2kbgxuae6bd8hlvpiqGsV
	IiXMzJTmBIcVDcV3R9wAsNfZvebLjquaLdpNl/f/Hd9Kz6Fu9IluX9njDbjKcaUtoQ4myy1vBGM
	54Dg9Eg0CtUhmim+HjLLIQxr2/hTicALD1z6JH5eNMvsvyhTOu88EHfOb2j5mPb+WqlGmGa5ZHN
	Hy30se0DAVKmaRyfVO+sOJDvvSQqbha3VhFArQabjj5KCFjjvuScSUvtb6MOcZhPaIAEoneBzZU
	KAafeEwzocCyMdw991MjxWsizjYduNqaSL34gePqbnHE=
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr22646315637.70.1784687498430;
        Tue, 21 Jul 2026 19:31:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr22646254637.70.1784687497959;
        Tue, 21 Jul 2026 19:31:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1e3d9sm3005785eec.5.2026.07.21.19.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:31:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:31:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] clk: qcom: Add Nord display clock controller
 support
Message-ID: <amArgrnqx2cCuZQw@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-4-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-4-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-GUID: eix5V6OcYfj4UOYyxcDbHDOF4-u1MIL7
X-Proofpoint-ORIG-GUID: eix5V6OcYfj4UOYyxcDbHDOF4-u1MIL7
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a602b8b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PSJN4lgLe9xo7xBllQAA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMSBTYWx0ZWRfX7gZQU+XSlvv3
 DGIcjaydoiGRvN/SldEY1JVJ0rbHT5C0emSo7OHdzYLDwoyZYUTzD+CLZeHTo41qXiXSnwWkUhs
 R1xVRguBDTbbtsOFxsUJK4WIihyuMmHG+UUffqI4HosKRkkTftzudFnrK58624NI0NRuEoHkkjj
 Y9YwCKCJX+eD3FaQIv+Crm2jNGovZGEutFvLLCU7SSx953BE1p0jfk28rblSuJkIXaVZuZC6uI7
 +g2g0iBznSoFBzOGTGmvUPC4t8P/kdZuDrHORbdgVK+mIc5shux5majROhBpDn1aI4JA7ujvDEg
 5A/AJVh3JHMdkraaLrOWmx/vC9mptab1AVQmUq6wZP3kKqOuOXXiAc/4loflUj8msNbUpg1bJI+
 GqV42fGmm6u50JWzIWrpCwTpRGLxt2HS0rnXBb3cJJu5IAd1NQmP6SH48MUAaEGtuOtiF3QD7u0
 9Oa/9F+OQYHfwlhWIuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMSBTYWx0ZWRfX5XsFsORwBqT8
 ii1pYW8ioTmXxX1BiPD+/C7rlyiRmxSfVsS1w5omoGL6WSQPpCz/rJVWcKec7VGm4dW44NXQLSh
 IPtZrEvx9pCsZwoMgRG8/uOce+HfcUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220021

On Tue, Jul 21, 2026 at 12:37:19PM +0530, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
