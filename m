Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3085840BCD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274196; cv=none; b=Kaj3/4kdeL5niqkExtjUTC9ZJO7Wj9/YeSFxIYomUxi4VcwzZjms+yX5mwS9oqeq6vyyJPeXltiQ5SHV4CjqXe2+vbjhQCoe4pCPIV5j/QrZi+PIcU4CCEYJooyYAYIpIFgQO6dFLn2hJUWRM4ytg2Pj6fUCv0+uAiLyRwsMNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274196; c=relaxed/simple;
	bh=oQ3cm8m+Vrx0gjPA7jzySxcyyOY42vyA16mLgvFWbK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8iA3zPfI8Ph2a2LKhMxu3uetww2Yo/WU5Vz0h6JjoRgAx6FjXmiEkSZPQQ/79psmyPnA1fPCfQ6WMCQaYPzh4EWY9Dnp/SCQNU3nUx9JotP8UYPpUjO3mO+bduo7cmX/9kKaZpY/BguxO3UFC+Ge9C3MHEBCgPX32wunKdh85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgpveQ+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezaQccZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgpveQ+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezaQccZo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8raZ2217330
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASyO/UHu81+4tc+FHnlvZ1SX
	IpfFftTRiBx/6D9Fz54=; b=XgpveQ+JT11qyb+b9igFAS/UnnOvfS5gVIG/iGfk
	/8r8vW2Bt+U7Wa6Tj9BEHZ5OsERmBnJ3fpqemL3vg2i23rgawVLkDeNBnIoJfBGn
	lTfg1mEXuoV8oqjFUHWwnI0ORJTpzBDrxQE7rr9SRnZoe7hqyxq0TtGwuUy4UwAr
	MXGxC5jtAjHR8vxgeIzv7xCsEklDUBjyxnQYRx5MP0+/gWstXcjuRQWBc1/2289/
	pFnNWTjo+lNLaWj/iMUlHbWI1j8yvv6Eqw6sxg7lrWi5pB4bxmb55FkELh6O9oCD
	nyknlVHUS40qk/jmid7QfvIw3yk2I4dQ5MQhMzIGszkijg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxb4ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:49:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso570081185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274194; x=1788878994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASyO/UHu81+4tc+FHnlvZ1SXIpfFftTRiBx/6D9Fz54=;
        b=ezaQccZo9tbMiRiNpqXYwFDmEx8OBRKH3w8071XqMM4CsAe0BnWZ7IJvFovFqUoTCk
         rhJK2TeG0heN3MruzPhdk/IrPt1McPRjjH3SET1q4cQWUJin8vQvibi4WQI7MSpZCplx
         vBx/7ywE8BpVfuIu9uirKPwQyHa5kqb18bV+I29cBgbHNHAk2w4S07DtfamDDFjl+lXl
         UrdMCun4WBqAoRaKBcVoRLdeWIe4WBBmSVZqgb24ut9+AxoKo8S8vUKpzvxkRDLrLRMy
         Sy66fjyBg4+eY9Jd2Q/mI1q7xw9lcOMB9KQAaWQGSUhHKU54S6WTrfHE8YSguUd1/Dh6
         krEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274194; x=1788878994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASyO/UHu81+4tc+FHnlvZ1SXIpfFftTRiBx/6D9Fz54=;
        b=JsBDM8pUbemq3ssVcKLPXmBR5a3XrzXNZvHA2+5Kta9vcRycuBOyk+cnxMBY9uIP2b
         dg1EZLIipzs/Cm6fcTu7u6J3di1Q0XFRA8guhk/M+Rp1xRGW6Cb1OieDhPpK07msSv5J
         ZCu1FAYra754gC43isruW/QN/vgEGIbRjDW3ibKr3bW9NSNscJ1SEU1OytbaDHCDuzH0
         VbuBwXOx6lq76LW3+Bzs9+OsFZeMhnehidJoP5gyygNkuGotKMmp6WEZCa7gtDOgxuTE
         YzLif+weYfJu9KiivAz2Pwf5lmArRyUFoQy7p3070gZzqgDHGu2uScI/+iQi023ydXKg
         TLDg==
X-Forwarded-Encrypted: i=1; AHgh+RpWNJAyMHTJZEoWKc6/qOSFU30n+HJkoFzrDcWtWVXuXmioGXfg/NTSPIka4ieIeU/YCRno0wqUs+sYaaYl@vger.kernel.org
X-Gm-Message-State: AFuF++lyYwB9v6l1xtyWzItcpHdsq6I/uqJtkbokreTb6XXE//YEwybx
	uoy67ht6i2f5Qc6BFqKifHI6lOTJT/NjGawcb9GiX/IB6jLl1kltrKgCft2jglkcw+qF36cTtnr
	H3vOJ2US2cd17okKGqTMtTsPg1GfbApEWmkVrLRTf62e7IZcmX5A+ZyuWTuS70KQGhO2/
X-Gm-Gg: AR+sD10E4tXlgitO8lsW4LoSvDADXHSs72LVsVmw/VKNDx58awmiMN+iCIo36ZjyWSY
	bUvtlWJNZB5kNSb1Ml0mrBV0J6utolQB1qndH1w8b+V/hh4H2fTQK7JHWNsb1xqeyUyHH3Wtg/y
	ylTZGbnehmFsOiKJ4eRNULxxXa1TSZ4FaKvs3n1iJdsPHO6i4BPFxWKWrHEzl/hnsY/V4+Tkkpd
	o3zCCvWaNBFeYdmXcMvT29/wUMZLdjUPnKmM4I1fU+2C6sdftgVJ66kgC9Laac4zsRtTNIJDOzp
	yf4emUKilVDoS/eQ68Agod3Z8YRng0Ua6wJXFHfP0neN60DjOFlEAc1GZomPegbcExcRwkl1X9L
	ew28rF4k9bsntbg==
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr3062394985a.36.1788274193405;
        Tue, 01 Sep 2026 07:49:53 -0700 (PDT)
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr3062384785a.36.1788274192638;
        Tue, 01 Sep 2026 07:49:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e826sm5215392f8f.19.2026.09.01.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:49:51 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:49:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add RPi Touch Display 2
 5-inch overlay
Message-ID: <qvgc6ku5gnk5fil5cnmwiji7552ouxdqt7oig5lxqvarxw3aw5@4wd7imptam5a>
References: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
X-Proofpoint-GUID: rwIIY3bntXsHQgPMcYCOkDC4bXosWsyP
X-Proofpoint-ORIG-GUID: rwIIY3bntXsHQgPMcYCOkDC4bXosWsyP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX2li7vWASRqWg
 opENVoOX2P4922iO9WbLfA41Gx3zgVfAQq4DmlvEJBDeUBSS0aA1V3UwkniNZW8IvDlCJmfOxIy
 o5LfkrVylFHrThc9NUdxM6TgElinmyI=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96e612 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=23Cz_ppem3x0p0_49vMA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX+Mv0485Qzl2w
 DaIYfwXTkeg5hSWN6w4i1iJDUQ5yTIY/hwG86EmFG59r9keeEeZ8W9a3VwYxpiTnVhR0/OYtx4i
 71KDAN9/27X7uiqHnjajMiIjZnK0hjOuM+3LWhmqFvM8wwOux6+2lDMAhS49kcT+IciB9Iwxykt
 MJcNKymuS2EPwve1Uv35kxnFUH4mScNJsK1+YuTfoNdFoRh9wsdbBiqVxJZbY+zadlcfWou6A+Y
 MYZ79IIR7KvCzDxsKk5Dqp8WsAHsDLxbZEWk0exgH6FbSn1lN1o7GuN6TrEGzov8JZuETvkeisL
 Ixvm7B2KklBLzKLxw52EfwO2P15b9t/T0Ohi8ML/PfQzqWmAD7GAb9B8a5jFBK9KoaQxj1ycpYP
 B8cPxeDW7WVSUobKI90hbFbpXNR2U+biuOKZU0Qjc/tU4XCTVNyo7JFhQgOpCWtMUwQlm/UUNyF
 I2O33PjdqHcfFMbNgOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

On 26-09-01 15:18:24, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
