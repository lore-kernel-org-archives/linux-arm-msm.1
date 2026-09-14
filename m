Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89B4749CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393788; cv=none; b=rv6/xzjx5KPCuCNaH/NK47+lkYZsAm1QlqeSLcdoA4nENw3/KwKNqETN0zjiJeNGob/50UjcqDIrPklmtgtvxDPSbRm552AOA9Al29QakXAwjWNpLLGTA6MaWsXXOHaos92U8/s263Q95fywBYXCq6HYC9FRy5D1pj8XI8PhrQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393788; c=relaxed/simple;
	bh=6AHLyVE4QuyvdlTlYMJyx2H1xgqwD8Xf4hHWGOe7I/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H42woPe1cQ5AWZMuCu5KX/IYG/CiY1Xn5jyJ+f1hXCJX/YvbNgqf9zYypO4Gaee+zpFYd/J3gKyqIai2yfs3cNKYnD4/kSluu6sg56JemqcyrewVP5shEtb7JmIAQMzkshHr/F2eDUhrS7oSn7QqDVMhXLDkXUrIGjvxpfTuZqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olnp8RNG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6hymXN4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Olnp8RNG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6hymXN4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Y4S830679
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66Ilw/BhdQorwglPgrPXKGQ8
	DdohrA6wrNblbndAVK0=; b=Olnp8RNGiwifM5mM/xgV2jCyyElqj0zcVQokDg8c
	P6hKbRv7fyRwyujvR0UdL8jQxHQQ+bQGjNbW3F+KWwvqRz+mwiaDmde+3s0Z+Eoh
	AClPlboLXcnsfIjo8yKI3GZ+rV4mhu+XPWO2lw4CW3NtyafDiX5zn4R7J1sB8OJN
	0LSKd5kzzRuX2ZvMcrKd1U2fpvm1Nh6p2SjjonD9LdAvLwoT7wZgpI4yH+EJ8Pxv
	/9nWdHC2c5OniYVArfCyOAgwaAS1izZVvKd/D0AShqUVFyWyNMx/0zgnMBvVNjmp
	dX1MLXKTheYHcpunhVnyetTT8w09jP/Ui/Nd6MOyLc6Uow==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstpsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:49:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82b120e93so779462e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393784; x=1789998584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66Ilw/BhdQorwglPgrPXKGQ8DdohrA6wrNblbndAVK0=;
        b=R6hymXN44MAuDUIwyKqbMbzdzyBAs7VtVobx4KJmMXjxpIm7kdRdN5M8B83/z5eKPu
         LkpNy6H3SEXgN0kEu+5sHpgVnAtCGjsxul1k0dNZHhilE+EmnWoY4wf/F8EP51nHDxdn
         3PGt6PG+l5v3K8qJlfeMGG5X/BV+zPe9scA6Hmm4RAU65TxsNU0nINXt6oZO8nJm0yg2
         zDzSgJjVH18bS9EFZV/i/bzy1/HVbkuaZ9tGpwTi50gJxIQn2SBK/YfbKHFWYXnZY8W+
         X3MY7uEYQOZ6TI9NQ002WR38p+5Q698eaIVWKJTxk/ZEAt62L4tOXN6qf6HYKZtolXgl
         VjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393784; x=1789998584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66Ilw/BhdQorwglPgrPXKGQ8DdohrA6wrNblbndAVK0=;
        b=V1jV8j8gtnI7tEYxJ/dNFv4Fu/Fg24RcESFKxe2MnDOyTX4sRLmknB1rkvfh5mfKQ7
         zxg7Rm1mZ21BzbYg93DaRRmP16JXbPf0qF6Zx5VwcgGo5pkg77PMcQM8XCzq3Oi6pZNY
         xUFJqEIsQ3J9Wsirsd2RPleZp4s6sjL2EMT662WhNSGliqZOfIYQsiPN+s/YR0dK/iqZ
         RxGM3ozX3zR6UqNL/MCJS6EI27kAHLSqQqXJHjmnLnwVvf8yF/ZG1rvB1rVdWycSNU+7
         NWRwICeWaz/20PHqvFzfKqm71nX8h5tEjiKgBxA3krzKkl2J/uuHGjQD8BUwXjMw4yl0
         ZiSw==
X-Forwarded-Encrypted: i=1; AKwUvBw0Pys5z+BnDH59HwRU5cS/D/iPc2HVqcsL7VrP0n2pSb2O4GvFrhfLKI4Mj0ko9FHmNFAduShXm5LcmX8E@vger.kernel.org
X-Gm-Message-State: AFuF++kCu1yHEGaGaEZH18XuZ9InaE35xDr82OOEQejoFiYAx+9H6PlV
	QfNhZso+mMjTTNcRiQOPV/32l5FRlse4tzH6TjbbIcQnNMcP0pRm7VXMZkg+1fcD7Tw69Z90aXl
	yj6h67PANQDDHx/fnYRiFwbPHX9sGGJycNDxctUZs947Yrtiacd/lf1M5b0+7Z4DVF50Q
X-Gm-Gg: AYBFou3HS+zAjoJDCpLjMDxZ3vZbilkACEhqkpd+S/mkhV+CAnhcD8jkx+ZBiPjFyZk
	9YdG1eZ9ArN5DpqFx6u4gp3rHTz/p/3W9cww10ONwowp5MkN0/TQiIK5/IxtoCytW1XUSwEuXvo
	bwgfT15WNO55P+wQGW9L/3xBhkT+R4FeCKE0N2AuDSQdjEWpjl9YPKMySFxwq1Y9DBGD82EuCIJ
	ex6VmBB8ppp64gn4hS9ktQn6xUmSg/9xZzrsF9Fb+LJYKdvRJH3/xXu5st3HlJ2faetoALqarrl
	6AP10EihmKwXd7gDOh1zrarB8KasQ0zXuTMmF2PjF+pmMPXW6u9T8QUfBXdnm97YSiq5zAXio4n
	X5atHQdKOmPfGW8M=
X-Received: by 2002:a05:6122:4895:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c981aa9b09mr2352257e0c.1.1789393784354;
        Mon, 14 Sep 2026 06:49:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4895:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c981aa9b09mr2352119e0c.1.1789393783803;
        Mon, 14 Sep 2026 06:49:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm26132106f8f.16.2026.09.14.06.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:49:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:49:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850
 WLAN support
Message-ID: <fdt6ma52b4ljob67egrfpai5m5uuejqab2hj5jbu4nmro2osg4@uhqloj4mptw6>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXwc+BZiT5e+5j
 cEMEqo87HuxfV/wCuNhR4UEYFzV0ctcJVIpyB6Ci512BDClxdQwrM8ppFcI8cnuOLv+NAlLFFkD
 xJTGulEOQJjlG/9zAD+0rCnwVotqIJqXClRdSnZIKGyqnwjG2q3qL08Ddb5nQmJo/XM5RoAMGf2
 dIGRi050oZ3G71IAPKc/hv8oC6bOvIEwW9d+jcZ/W3ft7h3DxKClC+f2ehSKbxmmJa1GGwN/EWb
 MSsBxvoRSafqYuOEe+H0ycSTJ+xueliTZE2LBMeFsXSl/QDEpViEfsdrcXJttbfntVA26bHs391
 Uhp3rjRzVV8h9auHdQV3xQSxnh5oV32llxRIbUMVpHf/dVT6ROBxN4LcVq1jr6pofEGJmqFJIf7
 +xbSepUjBZ5T5wlaO+wgheIqkl5/32xrELVLrGFRrNuN+E+FiI7p+KHiGLnmWv7ghPvoY6TGzF+
 sfLSUCZgeecU6ir//5A==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7fb79 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QryoO0P2UFxYqXaw9vcA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: saGW2aTcijdFDZN3Yw9VJzfAAJVVRUoP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX6lgOYSa9HUVy
 ki1IWxoGJ4qkY2YKX6AkD7VqnvMCfQrr3BQlFuNdnRQgi67MB8TKEzOtWGmQKuGSywUEmUk6J7N
 xTGPD5u9jvM1k5s0yOxluNogB5CXjTw=
X-Proofpoint-ORIG-GUID: saGW2aTcijdFDZN3Yw9VJzfAAJVVRUoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140198

On 26-09-14 15:19:43, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
> a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
> PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
