Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060BF4F4747
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413095; cv=none; b=Ol2yiITZKYGsQ04qrCSuPrmvmEvdX216OzC6JDuNQfPIYIjt3OxIJZ6zBwISXEtARVLFaso3zUg2bApBoT15QdWvIxmUpxk5/Pg+hZySQLSyIP0uqrhIulPFWyZnLvpA03MPQHebUBZKlbksK+S0Mku/6aDAnaCIyhSPZEnPkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413095; c=relaxed/simple;
	bh=8EGxWuYlQ7OXKhzQbvph7ohelP0EC9V3y0OQ4e+V/kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfQmx9OVlK0QaIbwTnYQUVLZ5TkU+N3FtaqMjbHMKZLmtgeQzyG4GivYCECRqls20+b9BUVp+rt+gwr9naQTpjX5TDLCxLkSga7X6b1bpf/QCwKd4jCabdVgqoTKN2KXgO6zFwiaUN1J3WofLAhpBH37cRjo2tHBUk0jy8i+rIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgXxb2lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFDzvlTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgXxb2lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFDzvlTp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P9Qc2753903
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=; b=PgXxb2lPr8/6R74a
	4EMF60QmvDN4AltVu/aRXIWapYshPM/aRd4TppnpCrjI/2YXQZXRbZiG5jh3glSM
	uujC8uFb78h+4iejMiPiX452wkGFjRXatOYLOr3oX9r3bTTCqC/Ga4GV+DK3cAtt
	MJLjnjk0WlKolKmr0hV6zrQkixIrEl0RnSJMeQUKoUuBchNISoR+n72biJ1+KHhF
	rURKfkxtN41j3pfXzodr0d1rFmjtDh8ninwh9p9QNbkAeTmJnzo+mag9ngY8aOCk
	EJP7C+hrRL6ViFFbY2a3N85q3WHWyxjkHfgFuJMHXkW/kwToWiu7zmncNykthO2X
	bftmYQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48h1jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:31:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so50138137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792413074; x=1793017874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=;
        b=OFDzvlTp/N0w2LPyJj2V5eNWoT1x7HH9DMhPelhybapq0L+1DwQgeHOQoDHTeWjPiC
         O53LVtBBJhN4ijmjKKyC1c+rF/Wa6vwAxNLbxEbM1VrznujPxlkZWcH1LUObOLsBf6Qo
         UZHAKHqx23AsfdtNoOEyNQF5GOgpRgcOfx4jT6HJeF2oeXyUQU6ZgHxCgzxCkc7jdN4I
         iTGYv5SQBcSCK37eEEQAKDs7Y+FlGR0eRudS06nXX9SVeawWQ/HuJRW8YWaBCPnH/XcF
         kYGz20UQ8f4IEeHZEp6xkzP6waCglVPhCpK0p7ppUnmDxumTdRaFBSOpSKOWYYNeZ68X
         aufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413074; x=1793017874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=;
        b=EgkJVg4kRLpt5L2gUZveOTZmMvOPOcKQszS90z2JQ7o17sAABe1TUrVyUq3Qq9K3fK
         Sm8LJJLIiQiNYvAkIj4IXKjrohKVeQjkf649O/2gNLNQQrGPDQ6B6GtvZHnDX1HHnpL3
         w3Uao522QEaNMkoZKJ/GNT8e5+wd1hcF2dEZwG5bDkTrwXRMdlsoCIFrBPB6Cr9NmEWY
         8VAJ1tzcBF23H5Pm75E/QgnHp1BfbDSsC2ebk10FbZ4/ysVuQfzj4fpAT8NL9VOtd+yW
         mfXSBTUktFfRel6fe4hJ4v3TnlqXC/g+G2cZBlwX2DhIZDNADpnmYDt5TBbaJ4oxGTSb
         Wwfg==
X-Gm-Message-State: AFq9FYLHFGXvrjpmn0SpQsbq4XunSlFVjhmaHMS3IWTIAimQuwWCWFYR
	dITRpSEK3oMf5TMD603QdGkPassXxrGF7GGp37OAdP1NJr6iV2xbjutv56z8j6eAuBLIYSKXIzJ
	01rSx9cFMKQ0udn2keON8agJTYz1dXXIBMtIHzEQG4xMBC7CPJ+6NupW6A4z3vrfXNlRQ
X-Gm-Gg: AYBFou3OByWguh7htiyARKm1Wyk8hYHEsnOL60CmwaJIXNehl/uYIQd4rYaL/2Voz6j
	g7jcXkAV0CQ+uJKpagnQu9NWdtgeph5uwt4SlqhMfn5NZWb4dsFtwmpgjmO6XA0L6wdTJDTOR3t
	3dQ3ohVVS0soXSuYxBmDZ6C2m4k0lMjF8r7hSx/kCvUmQKekPzdUX2955eO7WPSer46FKPWriC/
	PovDegOptrm+UgZlHmlzEtcaQjmoivrOIV+61JY+9Ypi+DHJ/VMaKQLX5M4zTPXiYuHTsHOAALk
	yevgjBBril2IjU9YsiIaXKF2E2xirEPnfvbavnkVD+onFgZ5NgBw6Z+IChsLJbyo+i6l6vbNIkg
	PoiCQwhUAVCBavVmcVPV+YA==
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr1517852137.3.1792413073513;
        Mon, 19 Oct 2026 05:31:13 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr1517832137.3.1792413072286;
        Mon, 19 Oct 2026 05:31:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea48bsm3601007a12.35.2026.10.19.05.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:31:11 -0700 (PDT)
Message-ID: <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:31:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX0Ik8LCuEsqY2
 TqM64SV8mpm4lKsvFRr85NweWmsmOAWeY0ejhWeeh7FGZC8ndZZuvBn82fTAVLvEAsUiBUzYP4w
 WzHVHb4cHT5nta4zPK7PGHOd9Rif4OpY1iFKu7Xdj0tQWVkJSHBJCMauHV0DQnokz9/O8KIQfNp
 A+JEYqWee0YTncqjQ70baLxhwdIKCF2yDm0a4bL8xFzjmNPhUqTBIPwPne1E+vZcbudphKMas1L
 4Q3y6zjVjSTptIjR3TttOKx5MqgyxIHpsfodobXr+IRt41jwIviX8IEcb6tS1lNYwKo4tcMf5YA
 8H0wSJNZp399jhZI7O450x9fFbeNkbOa309BjNwzHfqfgdP4wsSuAId260OP2c29g3y5kbOko3w
 zkMKJzN39M9rk4eGFFFaGKoVnQ0A3YO8qanjhVTFk14N4lC/kXPSivKIPlY5rl3fPc9++wKNpCL
 Gy9Hza/yE5LNKA8ZyrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX7DHKYYSJqN8R
 bsEUmk0zgjzCB+6cOBFQXJV1odISVd5ITcIDeqYgf4poGrFbiTteCnnoptJns4S8Tua6PTSWokr
 YEQDxYAtoda9DKblG6MScpr1lMQchIE=
X-Proofpoint-ORIG-GUID: cK-jsDFus6hyPdGfc-jaD3LRLrAS5V1Y
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad60d92 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2y-c5VRBA9tA1ecnzscA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: cK-jsDFus6hyPdGfc-jaD3LRLrAS5V1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190049

On 10/19/26 12:27 PM, Gopikishan Thawre wrote:
> Add the device tree for the LeMans Draco EVK platform which combines
> the LeMans Draco EVK SoM and Draco carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 

[...]

> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {

Please drop unused labels

Konrad
