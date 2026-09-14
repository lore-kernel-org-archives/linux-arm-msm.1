Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C90471CEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393736; cv=none; b=VcQujbkpSu8fMDCH5m2Pkf6yIQsPg39QZbGer94fwPw3Mvffllf2A0QlXDZX6cjJnAgTqWdOKGgBd3ln3rQMooyBGvYlgJXSMYYg7HvaWJjxgQTwP2Ok/zzXtPMWfb9ITl2eWxpPMe1rCxLUwbvYBOS1XoG9+rZ6iYJ2k5WadBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393736; c=relaxed/simple;
	bh=Q8ZXy1xBBvy8lrpFzAtZcyAMCBcySBhfVdRbhCWPp14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjIjtO+h3/W4gxIZVQT2F7u5+KnHj7do8ImMmKuqieMVwo46akhHA9GM8B/MW9Eo5Nhx539j2c79oay/erMFqUaNdl3w0dZJQmn4LxBS971BpyOl20yPN8BzYzGAHnJ8YS5wghlk6abgRMhCM/1dnH5T+xUA9nDE2eV6xnhr6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUu3aVqF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AECIQ4Zn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUu3aVqF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AECIQ4Zn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0dTW1200591
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HMyYfEPKVPkxA/d87ABHMAG9
	5ycoJXhnJC7wLe1or9w=; b=HUu3aVqFiirJA9RCbcMDlhxUU/oU9tyKPaXmtbxi
	O0uxFCGk7fyPJhc5XGw7uWWb7B6FPp4qB2HRyLpGaLZpKySgIYQzne698TGFEERb
	yNYeTHuOgKHyApl0wc+UibOseGORQ7hGNTVlqIHkdwD3wpw+sFhrNcKj3661TyNd
	c450Ma9A3qokdqKGzTYKB2U/Jw8v00lQkGK5NnWqP1itJ9fPsf4oQoSub00iQpWh
	eoa99O5I8xNyOVy9yHOOpk3+YjMPfmyxJYyv2S2gKMuvny2cIlaiF2e8drlCnrUS
	ktr6u8Ago/70Y/Fg5hagacJarpTiUlgfLWva2lMhpMa/uQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevs4ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:48:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso1160393e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393732; x=1789998532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMyYfEPKVPkxA/d87ABHMAG95ycoJXhnJC7wLe1or9w=;
        b=AECIQ4ZnqFFU6wPCfxhYASQ3TrcY3QvExsaA4qYkdakzy1DYO4AVdv0vcwCMV1Lzjo
         NPSTJR9FXt//6GXKg7NJq7gNpFxNwErmxu9e4kKy8g5tYYGAJ9NKoLNJwRo/IkirxP2q
         aYDZ/b3bh3mD2svDybFUy+MC15e4JZMR93Z7n0Los4gOXS3d1Sku6fkCyhVkW04FmL6B
         0rC9xMkJ8Qp2mfzQf4DVy6ZNXB96QJBEQQL1n5aL2ZOrvWb8GBtdHLtuJyYNfQCDU849
         7cdAS8kfZ6jeqcYNYQXnacAAGwI1TBwPU4tOL/exZrCU4O601f/o0ttqn9Gt7NswDvXI
         uAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393732; x=1789998532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMyYfEPKVPkxA/d87ABHMAG95ycoJXhnJC7wLe1or9w=;
        b=eHDaXMxHwAD/PqMgMjgMIGUzN1G1Un/WXWs1f8PNgX2mmWFzy7zi8yPxC39c1BG5tY
         nzgKufxoXvHTd76SyQ23pHqwxzGo75z/UbZvEGyNZ6gtGi5fFhfznOVXJftPDiHu2/BP
         Hg9plU1JW+yHl7UJe6kMlLqsURSs2yDavjV2lCx/WD38ajD7gDG7kCYXC4TR0g0iPNsM
         pHEsvUwDB1dAHhAAMveW8h8ONs/fC6IXdHLNr9vbsud/5gH8b3cs5DwoC183bdneBXB6
         X+BxLPz9xnA5EUkBmVR8bF7wxuYjSWQcLNN4lGzJGKNkwzyQ453Y8qPkiL5s56PKnkw3
         84IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhb1PwzTh5iVl/nWqJNPBE8nSg1i6vJy4pAe1SDZOaung+bwZC3ofZ9m8s59hLX8EDODC9PZQ2GOizrspU@vger.kernel.org
X-Gm-Message-State: AFuF++lyGCVA+7oHEJv03YqtzvDW/o2rFR1vbvMCZ+1dM+4+DDSJe1oX
	9Ci8Vm7Qvo8pujr/U9/15R2eqvZqLgv/9uryDocdhWW2cbeHKE0Xf8URG4sdchGEATslsUZo7+a
	hwkmX2ibpSvYAr4avca21mw+IKZDusgO4VZbPJFRtr6YSvwgtYqPQhqoJ6LULTMjgB6i6
X-Gm-Gg: AYBFou2tzdka+BERWDbeu19E1yIw+EJqJG2GL3S4mRIsxaloWRILuar+VlHvrOvDnRI
	X+1BO4gVrei+HeVl3FsJta5Z3Hle4NNICm8cm5Dt1B6XfgfLlfNeRMH9kOlLtKRCenO4hWEJdnq
	03y7p7Y5xPblNtjIbg0f9TbvO21aiCQQFaysFVJh32sWKeYtIz63shc0/MOj0hCcV9lkdYnvPAq
	Xp2/3mkQzB2ZODrVQGnX18Vb1w9SvQReFXGUIFIq9gpYkHkiobpvznPvw2BsJRSahSbT9ELZNxs
	PUCKVg7H26Mc7iRPHUZnbGfUXT9diXzeIKuUhJwv39imdV0BBepiRrKGZeOx9nDwntspI2zD6iN
	ql3vUGZ/Fb3yBWw==
X-Received: by 2002:a05:6122:469f:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c981d4c288mr1986367e0c.6.1789393731571;
        Mon, 14 Sep 2026 06:48:51 -0700 (PDT)
X-Received: by 2002:a05:6122:469f:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c981d4c288mr1986323e0c.6.1789393731045;
        Mon, 14 Sep 2026 06:48:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm25548638f8f.36.2026.09.14.06.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:48:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:48:48 +0300
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
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe
 controllers and PHY
Message-ID: <64swtxcifxs76ke3hvjk3t6b5utapnlptwuaompawxks2332zb@3vi75y5zytt3>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hWr3XZGL5WMM0ffeAHBkVQJS5QArEhka
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX7ATQuL1oQADd
 EyqAPhq1uG4xFxA12jQQr+HyorDeHdpPbwjlstoYfCzFtHGkYzQv9D9ClB8ZnVS4MT/1xNd+2iA
 TrliroPqdmotSsEbZ4tN4nEdSsl5TJA=
X-Proofpoint-GUID: hWr3XZGL5WMM0ffeAHBkVQJS5QArEhka
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7fb44 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=393rYoDGjkx6UDgLgWgA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX+8A2d3DErX09
 59oKmw0UOhQEMQrtZog75pjiEjXBTHZ68Z19UYyk9dSlyUKyrUOx8lG6EsCW2noGaBvGQzXEb73
 frWei3bcseEwl2jXiudm+Dn9bUdq6IlX3JzxCoCJxLKVERpITw+auan0BAihVfqSfmmtD58NPR7
 ROLZVVAFi0wIDxEjCb86CIx0G6pVowVV+SQ2z2w34Iy+aS7jPmFNFSqAWtJf4aZA6AsLyOzXq36
 1IOccnuz6SVoY1JoErghCCDLQWXOjmTXdDPXN6WURwGurVOglCdh3+Pb1Iyz1sKG3cDLg/i1+0l
 RrIZAWdGL3RBOYdvCwMcXo5qZezhSYNWun+4ax+wN498Zb8Lov/v7AVvJ83PpRg5YQ4l0nqwS2y
 nQ2lBeFtb67e2RcO5HHN9SF3fX882YhxkWEcZ7kBkx55hOz93MPIphi8fVWGRb6KqPEkDMEbbQR
 KSXGEPlBbwmtzuhlblw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140197

On 26-09-14 15:19:42, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Ride Embedded board routes all four PCIe links, so enable
> pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
