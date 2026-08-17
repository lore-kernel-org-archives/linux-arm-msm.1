Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA690313E2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940338; cv=none; b=VXuclhvci5be7EzfYoM6LJXRyXz/Eq43UQwjxHWOPJV1lSZPWI2N/46VNi1WSuGTA80LlUvQHlUI0Zu8ypcRbFLhb3Q7cAHbTw3mFa/KeOAEaLVjjr+bw02JrLjCiaQzDhAq6NWpHiXz4rSkt0pFNdB8ln/xL6EPGZ1U1Wj0DXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940338; c=relaxed/simple;
	bh=6L2iqZCBsYzqj/HAUudwFvBppLuKS76byrKmvQqpUY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnSEcKY66yWjhhCFU+gQWhVkCPi3BDif+4WvrOoO+539mK91sZ+zz64EtP4dfA+UsNHcfobLeyA3uMEiCJZwOZlM5Mw64YzwvFefaqadOFvYa2QE3sg0e+DjbdEi+Wuua2TJ9qCGriAQlXGEERo/ktOb/sbeJIkR09kq9yfigiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiM8wgjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnV7fkyw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiM8wgjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnV7fkyw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLD0qa4118994
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9k1AN/bNkgGI52BUQrkgfw0H
	gLaOSJlWZr7YU9FaXkk=; b=SiM8wgjtNX80XaBjN4h6Wibt/MlKRiicbG9yWzcz
	CL6U14OHvkEIFpyOGOoPWecMgLXz43JkyQbxD2n52NoswMV5Vu9LFuCloboxSyB1
	gyQweTquQf3k/+X4G+ypFDHW1FqtrNGyx0xXF2b5o/4P/MlfPwEBSSblxqscsDN3
	qiIkXdYlNIueKTxN9jve7yGHOiEHA+8L0YSi4q+AIWlUcLYfGFrSk0Y+eJrRwfvw
	4/ACfQOrwk0H3iIhxFQEYDSLzIqRASOhvoLU7AAEmqbCg5zOZ+RphXzNpcAg6W/D
	DMAkGndsY/CwZVRzDkihOl2TmpdQwkuHKtpQNmr6Ml76BQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfd5wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:18:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so540149285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 21:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786940335; x=1787545135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9k1AN/bNkgGI52BUQrkgfw0HgLaOSJlWZr7YU9FaXkk=;
        b=FnV7fkywbjAjbWINn2WrbvUyVbBApNkUdCzzeEEqXARD/elv1+RQQPGNOnz62CkePS
         gQ8irLFGWspf8aCSjvHXHM6XGU1+QX5QxZygQWCMX/WS5GbqFhvVpMasPUME53eXneh4
         d01yM8iH5Fb/fxfnGVf4IyEpgLDwgk+PYub0rXVN+CAwUaEQkQSwewpE/4LH+n8L0atP
         AQQxplOXPfGtVwnXyR1FowHkPQNCCVPNCAOAieWKmrO5pmA597Lit307KOjZtrUJm2pH
         nSccogOsVUY3WAWDmFmEG8ZHJN/6CODHpWqj3IX6f3/iTijIGO1dbL/aGuNtPifYbzwn
         ZDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940335; x=1787545135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k1AN/bNkgGI52BUQrkgfw0HgLaOSJlWZr7YU9FaXkk=;
        b=YvU9nKzDXD9Ytamk3KVG+srpZowc+JpX2xZdj3DEb2c0HRVD7Xoef0PuO/KKNgEoou
         J1QTTXJmrjldQFXYq2ynlty/B6BorI+9L3oFRmi41tjAiB8kV38EWM3jzDIKeFO5tj0I
         lJhROuYRCT2XILsVINBDywA/KCLIUDVKSyOQcE7hbJ5LtM7T8laHoV7xsO1QanOeyr8i
         sm2B0ujR5ahDcKZ7hEq+8HCXd+Eo0On6RiwGk7fXB8dRYGiYpdycqq2Ua6rIEI5n1lqL
         UemCnDbgEtZ9crdUhhvZx1XMRvNscya94ixNyxgO5CQ0RVu9jJZuyDycYZ95kd5gL3r1
         RPJg==
X-Forwarded-Encrypted: i=1; AHgh+RrWuEdH+40+gHK0MyZpe4JphQkrYa87QXKXlLzvwWxK8m/PuaE9mZaKFX0J1+aT81iG45KAr7saJU4itSQI@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3l1XVJ9uT4trBTJZE/x/vSzLP+XsX8yK/zCat6zecexCcUky
	HyahjUtSxOLAm82bM6mmOWKNFhtD30M9Wj68EmD6txEaMTlQKegHstSjDeuOnwDmaga+W0fnXi/
	GD+4ILTJJX6I6mRntOhKufIVsIDGyuM5dUdVbfXU8pcHzPStYfPHJCkxVbd3GQNl/HINX
X-Gm-Gg: AR+sD10qRuYCLJquRM/HWga9PZsSoJYAudGikqXOB5xMzT6jSq5QADoui/hVbx+K/ge
	+YA1QQ7VVi9GXHHf9MKGPrFwG0/4sfZrj4ww89rlUJo04QUTANZaFt45F1BH02WXvu3lvtzqWn/
	Jd+lvT02lCMtnpfiv6VYMboN7pw0lPzUxIuQjz8TUjAuzEHu883ntMNIF+NRkfEMbFN0YMI7Mkg
	T/CLyNTMd1TFQlbGc0+WajxPK9lcXyFlxoJ9xaDAwDPu4FaBbka1XLNRqI+jyPpPj/CSO8vZx1s
	Vg+ICaEIahyqnFhqb57/+WHWf73Abqy1q9ioloCgjIZ1T0XsLz2ETvxyKA4iF7YRullrqPZjDY8
	MljVySx5iEPNW3bXTRdJZ2F319qevBZLTI+YZ3RWXaLTuvujT6CeNigORJP5V82u+XUYgyq5ERU
	SlywDn4EiycmcP
X-Received: by 2002:a05:620a:6609:b0:92f:362:80a0 with SMTP id af79cd13be357-936d1fd6997mr2559624685a.6.1786940334951;
        Sun, 16 Aug 2026 21:18:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6609:b0:92f:362:80a0 with SMTP id af79cd13be357-936d1fd6997mr2559562785a.6.1786940319565;
        Sun, 16 Aug 2026 21:18:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa1227sm39261e87.22.2026.08.16.21.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:18:37 -0700 (PDT)
Date: Mon, 17 Aug 2026 07:18:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP
 node names
Message-ID: <qqyfk2coesczcgkv2a6pqr33mjv4j55qzzoqqtsuue7skwgveu@u4ytyrzohnoo>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
 <20260816123648.1632681-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816123648.1632681-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfXwDxMqdp02tUS
 n1sSTPBjATbQ/L/6QFbzQfLF6krlrnBmNFrH4jl2j3KTemgew15DZ6OlnhuKkNezZibD6hV+V+o
 o2+Ns1fR28pSLON+oriCHDNRu1BqmjA=
X-Proofpoint-ORIG-GUID: I2L_Fe89xCuuLjSq5cr1Qh9Ya8-2o4Oz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX1LXuMx5abSd5
 y1mzgSfzeLebVIZarCCCPnwzwbc1Yukw3Qcep+kk/zz173yzs7sbkAqrEK3mIuemFHBacpd+SeR
 mi9skPG/7xwvpBN77R4/+mMxoMMzkQRnk1b5NhAUtjHN1idVDDTfjD4wy6QP16sCOFOGKwnanpo
 84wSHGXpcaM74wr8YEz08Vg7b0ADaYjB9+frIEkDAnVdd5TY41d2VtFDjxnCF6Cj+NjCZRyLOzR
 +TtAs1G3rst4Ma6Zr1eSesCq9EV5kwXO+1G0kbwb5LHAcgOf1YorcXgpQlDs1z4BmWiwd3oGjRT
 0KYc3LlW3slTZ7PM9cK+FNTsIpwekxaJDpgtIO4WuGMkzPw4UnB3uWUhZNZ4NZ0ffAMLJ4YwFzd
 LVhm+nqIn20raip6tBoRw4sHXtIRZizO9K21hGLi5M40KWyPJlRos5lUkmjjP3jkP0HB5Sg8E8i
 BZcW9+LUQErM+PNUFgg==
X-Proofpoint-GUID: I2L_Fe89xCuuLjSq5cr1Qh9Ya8-2o4Oz
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=6a828baf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=zuKYxuzwKyNl2D12Vk4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170030

On Sun, Aug 16, 2026 at 08:36:48PM +0800, Shawn Guo wrote:
> Two OPP nodes in the rpmhpd OPP table are named opp2 and opp3, while the
> surrounding nodes in the same table use the opp-N form.  Rename them for
> consistency.  Change should be safe, because node names are not
> considered an ABI, and all references go through labels.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
