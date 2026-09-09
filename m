Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282995678FD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965198; cv=none; b=SxADj0WhNFZBKJI6cW26v1yxlkuvsDlW3RIDuDDn0+jLm71IjEcNIGplAHc/+SEZ04KDv9k0nWDqWonr71Yq5gx9OODizJD+VXLDRA4TQzdotTvtSYjiAtCwGu3RP1c7oPpgF1iQabgtoDtLDCyqNRfxnTHsbKgqcmKOxU7e95I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965198; c=relaxed/simple;
	bh=WHAwSFxjJ9jgZVTN/2aCy/s2cSEyKMoGgPrwH9znzMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgHBgG47J8XfreALJ2aU8q7n6jwAE33gaAUdwT8wtsWBiL7nJcZ54hhBDVzIggNusB68LhtA2aHe9DohEmNpeYz7V8B1/gxiwgwMGv5BOljvG1MHgqg/v+3yz1hZKazB15E3WaJW3XCh8nwAXhbiTT0I7wGoJjy1C3O0Y8u5fXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e42Jb5x3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVbh2iK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e42Jb5x3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVbh2iK4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU3Tb1810065
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reXlk+Vm7ZoMhAOag4Zge8fS
	Skr3m4Ae/zrxil59VGg=; b=e42Jb5x3QIzQNc+9kb+0RqmO2v72JM9MAMlUWg0j
	XmnZEW3ODMLTKv8Ah8vAjnxdnb6N6DnbnDwAelnNpcuf/H5kcNfK5UF0PUT9/BRq
	/C37hmtHGTc6KUbho1410OibeMoTybEllXVQhHGmpVxJFMRZdM/RDyVED3KKdhi0
	JY66JdWtN2mhwgb83wxPeiG28mk3m6MqKy+/Ju2yrJ/L5VZwE/NEzwptBt3ELHRx
	xUTDzNsc4v20pt8cgVqWEwT3QJAiOmkA4fihRv7Fv6vuLoorJEDZLZW8NdWIXKHG
	kA7h8FqkyTe1rgqbtLaQifUhsH501b6gnRv2rzN2hgxVqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj17qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:46:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d959904658so103844695ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965194; x=1789569994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=reXlk+Vm7ZoMhAOag4Zge8fSSkr3m4Ae/zrxil59VGg=;
        b=UVbh2iK4vp+oEqvqAcniOgtjujRgJPsLwu/fkCFAtzkwY/fONwrVn7MgiWTaiayDgv
         tEV9owr/y7A4jAn59tY734B4ZG/ZK2MEiAZMxgTDF+gm2Z3jqmjYgQNcFt4E3ywLmt7q
         BC8sdZBmiywHyUFjlLAHGVGZoaw0JFyeITKIsbSb4Dd+cZI6+BOiDrJY3xiwpPY5qF50
         1ExsfqrWAJYMuZHdZq77h9tBFaiFmuOHPSLVuPgeMHnpzYMwbtkbkRFIaPd6gL0pXX2c
         S4HcsxU0GXzHFtw9MRqRok48KxUwSsO/meroGQPE4pnhwhTkZVl2N0Pf3dx4OOLED0Cd
         nUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965194; x=1789569994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reXlk+Vm7ZoMhAOag4Zge8fSSkr3m4Ae/zrxil59VGg=;
        b=aXG7DX0cmgTULRYLhoLanJgR4skZDm4iueS9tLqy9A73+HcoOCuo70rzQDa16gNclo
         7k8hvLG6xvufM9WwQfzx5HbKZJ84Uvgxj7VZxCR5AgiTvKxNAaE8e0cVpUE8Dk5Ra9rd
         mn5t1qFbz6SM6+ajHPBoHybMJC1c7Z1WIhfNf1dMgpD3xST4NErh2Xy+SwApmjrPmt3o
         HzqOf37rYUBl4RLt2yHd3VY6NVnUTMZFtypdr+NtKqF5c2IKsVN3jfblBfdOzlG67Pmp
         I1q3rCX5fFRWnuhSc+r67SVJb3SfOxQgTWpO9uIw/fPc1M0ynoq2WfLrAG7uwxABYkD6
         zhlg==
X-Forwarded-Encrypted: i=1; AKwUvBxP7PPmduVQ7n2wKiYMpBJLAFVZgiroDJnLhTVKqL5gz4Rs2vz6xyd4gSjO+62Xsa7dssjinkYqKnECMLYn@vger.kernel.org
X-Gm-Message-State: AFuF++k+IEeQHBRxA6GXFycu8dIaqbf1912SrC/r2hfVVGHbpecHMe25
	6q7wLNWcLnTQj3R7X6C93yAaFbLL7m1bpz4b9nhkzAR8bNzI0yVxBDlHuC7JefToAajuuGeDN9c
	IcByN/VM6/sEVAbIpMgmo9JmWnB7PfBzLakL/8lOOBMn8hYP0+uIC7rx2opD27GvnvAcv
X-Gm-Gg: AYBFou3Sb9S5KyKIHOFFRXGZcJm/aA72fVMDpLa4ISdT5sDXCoo2YHhPrtoX4vuWnn/
	ww2NkNc0gi3+llsj2NdzoXGeFk8yRO3yD8GAXBYJy9RpdYsHjSzbRXBokvP3MlGRt1kv5EV4SXy
	eK+S8tcSEOwwlCvY69zRbC1qnF/eEdNg8wdVFj/xbd6K/A3ZFnSXjEJ3mEkefJ7PjvfsLX83Rf6
	G/NB2u3up6Qh+sAZGrEtoMCqMesBLbM6ZDuOtH67YQCZ7NSI+PMx5zdNbMr/s+PMt/DN1cY+ptx
	YT4UNbkFS7wVvgNDU6UwjrJA7mmJstUjiGMxLg+QqZsxe3vjOw/z0tzHbTBDg+zduvxjrTQAMOc
	gVxeQ2Ji+TrnQ2IuKnxUgs0IGqw75KDanu5YRnsnZ4cw=
X-Received: by 2002:a17:903:2a8b:b0:2db:117e:cf50 with SMTP id d9443c01a7336-2db8d8179aamr90365395ad.4.1788965194010;
        Wed, 09 Sep 2026 07:46:34 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2db:117e:cf50 with SMTP id d9443c01a7336-2db8d8179aamr90364515ad.4.1788965193455;
        Wed, 09 Sep 2026 07:46:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c15besm76126695ad.61.2026.09.09.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:46:33 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:46:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/5] ASoC: qcom: Add Nord Ride audio support
Message-ID: <aqFxQNkuFsO109t2@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX63dfwv7hTHSw
 u0A7U/Wk/v9MDkSCKVI3DbmjfcXCo/NmeEPAqDFcrfvIInP15uNEspdBBK2/57VZHe51uimiUF5
 ql0/IhbouPbpWZWkI1TfC9py841aUHQ=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa1714b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zgeMqk5D11JPSKe89ucA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -5nB1angyHNxg6AUW5v4GH1ocEmnmjsX
X-Proofpoint-GUID: -5nB1angyHNxg6AUW5v4GH1ocEmnmjsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX2kmmJTXg2kkf
 DpBpO+2SOUGZiGYjHiKh+bfVVJ6aSWp1HdWGde+Z71f3/rNShkg3hnqy9g7CpQ3T16lDpVcM7Ec
 uJ9KXddlps4mDBwUAf9tlpPCI70yPmRZxlvUQoCLMuPK4iY21PJHkqV7JwS9o/1X/+eg9OvoHmg
 nzhhiogpZhliDtRpgPwuA/wf4NUKM2Tzc7HMqcXj1/zdkpWEf3+Mf2wCA2xtb3aGQN48M6h93nK
 FpPuwmfE5motO+u0cUUMODY1PU85RxT7VKaKmDnQ86e6lHhcsnG7wixk74WPal5k3073WSrF9+V
 pyO1WYi9TlfON+uwd86ukkfnaZxayckfgqYFF01xcGsS/kA6DnKSRUuX9xkRimaSwSHMqEbpdPK
 EkzwnesbG47y8nbaaVAK3r8ftPBGtT7Axb7eVI74JeH0ofd2mHl0jJ1VBpboGv+Z13zThEkuT6D
 yyCt9r6Nd7dOplXYuBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On Mon, Sep 07, 2026 at 11:39:41PM +0530, Mohammad Rafi Shaik wrote:
> This series adds audio support for the Qualcomm Nord Ride platform and
> includes the required machine driver, device tree binding updates, and
> codec improvements needed for the board's external audio codec
> configuration.
> 
> Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
> Compared to other SC8280XP based platforms, Nord Ride requires
> board-specific DAI format and codec clock configuration to support
> the external PCM1681 DAC and ADAU1979 ADC.
> 
> The series includes:
>  - Adding OF device matching support to the ADAU1977/78/79 I2C driver,
>    enabling Device Tree based instantiation.
>  - Adding optional SCK clock support to the PCM1681 codec driver and
>    documenting the corresponding DT binding.
>  - Adding Nord Ride sound card support to the SC8280XP machine driver
>    with board-specific audio configuration.
>  - Adding DT bindings for the Nord Ride sound card.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Hi Mohammad,

May I ask to be copied on the posting of Nord patches? Thanks!

Shawn
