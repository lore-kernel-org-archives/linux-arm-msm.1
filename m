Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86D47207D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153898; cv=pass; b=Kxcp2W8G0omCe8TApwEjPuVIMLzs+A0wsUz1OMDiydwb853nuMGv01DWmf0WwljjvUjbfGpdSWOJla7upy2wS+NII/naRYeRj+cQbq6iYAnHUmfWJsDlVu+rpX8bLy1MnoLrQjA9v7WXMPULK3f2vk6LSXYoPbSzPaU4HoBXnoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153898; c=relaxed/simple;
	bh=DEdHFyUqhIHwdMf7dFxUJr1GC4MxdyoPmBAlHWHF1Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ndd6uQbtTwQkZhsLrwJZW+1idRH0k8DnPnxnaBbSpNxYl4v/QsdmNowCO7gQsfy0lxdL+d6y+lshe2ZI9vUczxLElOWWiHdERAy12U3pUf96yxBSNU5YXTwlJwervfdoMd5uNKcz+K9gvuAxWjh+mhT2cAg268jAzR8pLIiBhYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAgNDQsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zups68E3; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAgNDQsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zups68E3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JjFm2975619
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=; b=nAgNDQsgCam1E9vo
	/wdMED5YTAXYJuHQlykJJd6Y9Zeo9xU6nHLShLzRpnnoAn5lNOmob2t5y/nd+aLR
	LhLWnsMc7HtDQsKsfmdI86bFaNm0JY/NWXMS3VzayZfrJcrmBz+hbkyV8tTDj9oc
	GOiYCUg+g/dzGEpWQP/xHWMI7HjwOc0cfEufmHPWHLdqYva39mRP970AxXbVI84c
	tbr1WEzgoMYp0STCjhh92fR1/IeLPvxX5vFfy1wSULPPO98LBGtqKSIhNwxlrRP+
	refRGJXR16kNqtATzvqHci/H/vqrZL0B8hS4jjRFXq2Gi6UuEhBMTaEMA1TjcPwt
	6Z88Ug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n13rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:58:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1697261a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790153894; cv=none;
        d=google.com; s=arc-20260327;
        b=CN8nMivrIAeEH2DWXkZI+ikSdIVEKBASimZbtCMTTu6RjwKSa06Eeu8ibRKPzBNaLt
         rtyyIHrQeCdbFDoBDf7ureNmEvR4AyB0BeZMWd4x9d1FUgCOsBycT5j9wE/agf52rFF/
         CeehU13BI0RLxkTFjdPRTOtc+K8aIk9EL2uekIeiJcjEiguKpARE+1SbZeODiITS4rSv
         PrXIvm9R82s/FL6rQLKRraS/Pig+AFdI8gqk5yjpbWrJ6vlGttPvfup16Q/axgjzFvv+
         7ca41MHXmdTtjFYr+GdZffXN8Q83louEDWA+uHR6VMgn9SYyBcs/HNFa2BVK32w+Vg66
         nLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        fh=pQfb693cDvfmYwOg5tPJjkjHSxpoGQamjAJNaIU353o=;
        b=pV/lij1ybyN69/BLuDXk2YNritv2DMtCEyj19kDi9SSTG3s5fkDS9+6fB5MzbUJwtf
         TQy4UPNjJsOH40Ve0v1pBPRqOlXiPhbff8B53qzgznhn/YWZ6eZi5VRJP4dQSXo+6wUt
         F1vvTM5S1zwGuqGo6iUFgl0Ps2sSHMmajJktBPtw/gnfQmBKfyG4X2jwbKNBD3h2AOLG
         8wI4gCxsCeA+AI/fcegAW2MsMaZy3M1c8X6vhOcnOHpCWIv+PdsZdStfecAmqlXY1bi/
         zxL5XuFHbczDKWCEGNFFO/RH98VVQoV3Ktz0FIW+Eb57hW3d8ciAhdJHhzUUlyZrfkgI
         q2VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153894; x=1790758694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        b=Zups68E3q1jNyjytFGssUhDuSHLhbe0gUKxrmlCgaucYE4iLzmdhed+HlxSvnPfdx5
         Sz4W/W7n0asjV2oS8I+0+iZVXrosUzSCOaLHAEpvy6nWfxlMEmbo7BOqZJ8rEsNZKDr1
         ZPB8zQm6+G2Islbc6ZnrzxNj+A7iBWEVz0Qx9+Visk9ocCpZWPSk8uPknsPlf3N8ySJ/
         Iy7dSfXgCf0ELasUKtUyXu+om8hcYfEylY+Kx18GxVfsrT41r8TMfrKpSHaGY2SW7nYR
         I5N2qBDlMGSGdPL00YDWIZFJO/QY7SBg+WhXVC/ZJDy0esBILEp1Ty7vYCSKUQcgEJS6
         W62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153894; x=1790758694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        b=uCP1FI8UjdWr6KFpZnBce/Kjox4cJPUXI6r8sqtC8w967zRRFaZbfXPSSUu3mxNOID
         Ibs65SxE58OSVEKlYPNlmZjcMoGNx0V4+URibq3gmCoIHikQo/WyiGZh1uXAl1yLzTiF
         u0f0o90pih9c9UnNooLvEWzSuJAGZjSGkT0Kxzgmf1owIrYKTI2d9Help0eaj9X+yf4X
         93iTAKnhe7O7VjbFf2uN1/V+Ck4EAm87kqCuUvz9QNH/7dOBnSnn2djWVp9B0WbuqOp7
         zHuw0ncNucHnCkStcnWZdVFwrfwWcXkKBmRd95KTJ0AtVBVSifs9hfQL0F2R7iUCnjxj
         CWpw==
X-Forwarded-Encrypted: i=1; AKwUvByauwSN31mr24JQSudQHPAW+Qiqwzs5hpghqLtyxXlQR+T9Haoq8OboI0mey7W6j6gWdcbsOGyCfRwyeXzI@vger.kernel.org
X-Gm-Message-State: AFuF++myBbS26YhQyqKAedyLtdzpIBTNTdUC609LyrV/0FOaS7qKH9w/
	G/Hvf1D8dDeZfKqvw7O3jasLRETTIMEQyIzn507dLsZyzGivwZtnfeD50AuKuJ5m3T7sgIJLGYz
	Eper/tz5EKi+lffC8tMi7ZXJO9Ag+19M41hMvCu1VgVF3Adjg+RcGTpjt4ixMpdAUJSa6h6Tfj3
	3fyl7P/VGl6YCxIlpq5dChLmqxP/d8STxVyJXG3U5rh/k=
X-Gm-Gg: AYBFou1LCTC0PYq/+3Y6EJ1CR0dCUIiJyP9Mtv/W5RODCCMDTwxX8W0cyYsQByRGgi5
	bsjn202uKekU0KQtFHj8YwjD9eKVmVrmGizkG70ro3CqWRJ4sgfvwLhnRo3i88hkOUDXpD9eyn5
	4wUoFRJcMUYW6gd0ZFltGsM1WVynja+65IBiNtn9GxpIRXJidxJvqHOtAOOQ==
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id d9443c01a7336-2df69d1ae2cmr17991825ad.10.1790153894492;
        Wed, 23 Sep 2026 01:58:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id
 d9443c01a7336-2df69d1ae2cmr17991615ad.10.1790153893999; Wed, 23 Sep 2026
 01:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:58:03 +0800
X-Gm-Features: AcwNN1UZNW0WwmsWNc-3C7OHdDr5-ws6w2MX2XvUgjm7pentkYd7E7-hxDcU_-k
Message-ID: <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX545dHVTO4GLM
 VI8DL5xJmxPB4sDcsMkRGISYHV18hM0g/KWtsXGCmJNm/kwYz4d4qqbp3IK8mkZLrXU1tED09ad
 39xjXWDpOCWxVLE84/mzQgVM8MR25Bc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX4pI05/JQ+v1o
 P0WGBjp7YVh49+qW4WWS7phFqVfNJkTpoIAlUnuiizBq2ElsTPtMm96S0NZQiyBMK1vQ+nt50ZQ
 wKZD03iIW3Di2dVZ7RNgXU/P+8mPjWojFxESFLuf2FMy7rn1SUnijmzHEbNRMvoERWMFnoKgZpc
 Mko8Qw4rpciFapHrChzvDZc+dhdpYwk95hIHaxYW+BJayU706XV2puh2poFFZvW3NTQZSPBeTZn
 5Kl4Anv4Ec4bm6KXoIIxjuX/ZC1O1ETivZSk3+v+fLDsI++LZlJwlLHKm8n12bCjddM2MSxVGuZ
 sJ2Zup5WLbxpZMCG/Z+k046rUJNKyK8EqbLkcW+wjG/IOtqJhvkBZ0bk1I82CbTwPz3NJhbeNYZ
 KrwdVEQext0GuPvtCdOKfke6vvhCpSm75XFg1Y+jJ9dp2SzsAjFyVMpa0xJZWgXY5YF6hCOHo8s
 APEhuJEY3AQWUk/hm5w==
X-Proofpoint-ORIG-GUID: DB-QygIfa4YWqn1NWVCT8nwKXhCYP4_-
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab394a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=mh0Q8UrwBuG3fYCamwUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: DB-QygIfa4YWqn1NWVCT8nwKXhCYP4_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> wrote:
>
> This series adds support for the Ethernet SerDes found on the Qualcomm
> Nord SoC.
>
> Nord uses a QMP v7 SerDes block, which is an updated version of the
> SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
> currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used by
> SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerDes
> to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
>
> The series can be broadly divided into three parts:
>
>   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
>   2. Prepare the driver for PHY modes which require different SerDes
>      programming and readiness checks. Existing SA8775P behaviour is
>      unchanged.
>   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
>      sequence and readiness checks required for USXGMII and 10GBASE-R.
>
> The changes have been tested on the Nord Ride SX platform, which has a
> MV-Q6223 switch, running in fixed link USXGMII 10G mode.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> Mohd Ayaan Anwar (3):
>       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compatible
>       phy: qcom: sgmii-eth: prepare for additional PHY modes
>       phy: qcom: sgmii-eth: add Nord USXGMII support
>
>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 +++++++++++++++=
+++---
>  5 files changed, 219 insertions(+), 24 deletions(-)
> ---
> base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> change-id: 20260923-nord_ethernet_serdes-c486f715f383
>
> Best regards,
> --
> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>

Good Job=EF=BC=8C

Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Tested on both IQ10 RRD and Ride

Full test patch is in the git
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
