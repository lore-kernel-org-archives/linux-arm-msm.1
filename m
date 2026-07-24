Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA122E11DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898510; cv=none; b=M1CcTqgksP0ZA14FV8obfbfcEbYYVbqeu4m1zVWNsIYh/XlNOoDscG5BrD6GveCTDVIdqo8wkgHaTUd6px8VUSyLTXuR/U9SEE5EoOqUkWc6/EvGGDFS5zHr/5NjJ541pcNs28EDtdv5C+P5ubqlo7pthnB3RSdMrW0y4Xn88Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898510; c=relaxed/simple;
	bh=A1BKoOqqX0Il6/4DF/m2pPm+LFf8QN907xhCBZWURLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EbJS5ODQjB8dFDdL38ag/Nm1Ogl72bfSU6sx5p3mFFgjHYf8RQcD9Z6kOYA3Ipk4h4B/rFMNaovrs3jdvuifBqdt30+EpbLTiSq7bAlqIBbmtybhmupARpWWAsEp4a7BvUeC1CLt79sKAr4Hg0sFqXGbMwPfn+Aa446Tvo6CkN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbvTaXnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0S7Ad+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbvTaXnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0S7Ad+T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCm5Bx2980728
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=riWgEamynzDLFbM9De8VdF
	4Ty0Sbr1uwOeNHFEAzBro=; b=CbvTaXncgb6Q9W2TyYNk6Emw6m1uHEhBjspc10
	MKNff3w7FfRiNEPO6NEPu74xV7AIlc5Vd5b3TnIyisTRGe9ZhglWkmXZgVJCf3IB
	ilpPCpp7dgycBFQQpjhIASwRbPRj5/vYAVKN8nk2LDcKM496YA0am5op5wD3uMW0
	OvS0Oghs5mA+iaFUuKARO7Y+PrusjTvqx/1gOvvBixbbRthFaF8qKtVM4GtrTaiw
	eDaFnICVAyMFMkkyRnHpXyBtQrXriomWZ089l9K0Y1XwFpvABuqTl3qBWAbkgE5T
	pq3qSRO599PQ0WX8r240hWna7N1pJbVY/ltLxoy6i2GiWiyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgg2a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so9111331cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 06:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784898506; x=1785503306; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=riWgEamynzDLFbM9De8VdF4Ty0Sbr1uwOeNHFEAzBro=;
        b=V0S7Ad+TSQNDCr/asSAdEBx+Qy670iDnWjjNpUHaTB24B2aoh1qDWvyzZ2rM8UF/kr
         sDoWmWyzogvIKhMZhlJ4rL61URJN4g9aSEKhaEAXgEhRRrQUKNvJLBNdzF+EIcGtvh3y
         6Io0h8Bi6wfiQW6rtGSCPTeqJN65PM1Ejpb38/EPaqErrfwegGIde5wnQTSsNuhQ3+DB
         GwPCIK0cSUMVgScI92yNtpq/xSj3lcJtc8sHumrl2D0hsxdjHwd+4b91WBwxhgmH66g+
         8JXm2qloouiRJFFaf7Od1DAuW+54+RDTAn/5blcpSxhm4282oSRGfuH/IF+GRP3N5BDH
         4AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898506; x=1785503306;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=riWgEamynzDLFbM9De8VdF4Ty0Sbr1uwOeNHFEAzBro=;
        b=Q4jHIEKod8eYQ/JoFkxXyZ8GuvksytUtZGagONOVWbkpbE3lgRVJ1EYbdlP6+ArTZY
         GAA3vCQPiGn2xa2wgjfzevs+x12HRURG1l+QCJ3yvrR6uG1YqxlDOtUX/jqzTBU8wncu
         +sTGaG6/qTIWG/5GaBdpLecoHXlnKM6EihPyFtHVzcNCJcTatQEEPnx++lvu96EJuKSM
         A0t/sGLeU/1hGaFi9YVABQmOsc+Rd6Npb8awO/Ze4IyaMPEE8C8rY/JoCLay3BciMWHP
         ZYQRxt8nldmYGqkswILln/R4UdrnMWMbrR/Z7S3r9TwDlsL2HVKqi7nnthwx9Nb/0HJU
         MVeA==
X-Forwarded-Encrypted: i=1; AHgh+Ro39zFyqA55FAyS/IEvMsOqZWUl1HGsam5mCeQ11fXe82W/qkOuyW7iQ93NQA0w+qJjCZY/pfNT/cdyVYQA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6p3QuceSHCebhtLxmmVBoUH5/o/VAcONalUxo7b8K1To7m57
	j94D8GPbF8lmC8kitJD0W4TjGw91vjli1ebuqT4/pVZ4bRBOAsFORVOjFjXkZEgdCCPxYjysXqP
	+o8NxbEfLX6q/5/0O27lHLVar8hxQ/aBdekPj1hxu/pM/GmiJw6kYoRuSoMGO9WN6gnrQ
X-Gm-Gg: AR+sD11FZTaYV3UV2fgCZOSWE7y8Yh0IxmpbRqyoOxcjjv2lLW765sE5m+uFhSqEwek
	85hY++O607tKrcKeOq4maZrj7w2u0mODuA+Xhk5wcBIEtp/Dl7UOZAMKeDjkwEWfm3lExQIOtMd
	vcaU+ML+iWkfUfwcRUel0J9hm/samtY4wITFeNsJnTPX0RONsPdH3+XApiyiKyzvIPQi8WeV5Di
	UtCt1mot/L6jZDZD6VIaImEGR2T+gYoa65dbBEl5lVTOgVNVn0jDzxbktVqwzZTymHTA7p1p4YT
	U2SSbap5Tde2A+9Sua4Tayo/t8QdRi5JpmyPbC5y/nbYd4qku7Qs8m+HOZT3weus02bfehIuY5D
	tlwWR2eSo
X-Received: by 2002:a05:622a:4289:b0:517:b68a:8d84 with SMTP id d75a77b69052e-5283df3184emr68391771cf.56.1784898506247;
        Fri, 24 Jul 2026 06:08:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4289:b0:517:b68a:8d84 with SMTP id d75a77b69052e-5283df3184emr68391011cf.56.1784898505630;
        Fri, 24 Jul 2026 06:08:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm64921045e9.10.2026.07.24.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:08:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] ASoC: qcom: x1e80100: allow WSA channel map
 override
Date: Fri, 24 Jul 2026 16:08:17 +0300
Message-Id: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMFjY2oC/yXNyw7CIBCF4VdpZu0klFRQX8W4gOmoGC4VRJs0f
 XepLr/FOf8ChbPjAqdugcxvV1yKDXLXAd1NvDG6sRmkkEpoOaAdsKQaR3xSCjj3fBC9EGi8Tx+
 sFHCbRfYYzIR7e2SyUpNWCtrllPnq5l/ufPm7VPtgem0NWNcv6348sJAAAAA=
X-Change-ID: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=A1BKoOqqX0Il6/4DF/m2pPm+LFf8QN907xhCBZWURLg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqY2PEpUlM2h7HF9P3jwjJTlwDextLwPHnFv4Ij
 Tyglwl7NZKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamNjxAAKCRAbX0TJAJUV
 VjIFD/9dfM7RrYMI1O/N/cwukTrZ+IG1RYQseyG4F4HR1K95ORaIMPlzhx6QAr2NdEHXeR3FXYA
 shdg9FGvgsGv9/CbL2AzIIJrCYHzPHEHBcUA0yxAO+1BfHVjSOcvpvDpGUHMYOjNre8TrsczGjN
 YgMQIyyJMhLU8nuUASUsSGtuD5gAEqDBFu5EkHMrQ5cEm+fcbeBOMRbE0F4PgX5goWK9nr+KeVi
 ki834wGTPTc1SD9GYdPCQo1VbmPbEQpP5ouRxNO9wiMKyJTuzqV1/zihaYYFQUP5A0eeGpm9OXd
 HL8eEUPKPP6jT0Gf436zLPMyT4u14l7our7Sobivl87WUnfHUPIWzwA+OdC1o+s/CtU5aQfugCv
 az4eENic1WcfDAk3NoqYOiJO+VmLVRIuLfOhTacgzmvtIJtB8IThvNkafldE7wkTUYl5S8wM97+
 seQAGqV9boML39imS7lbpQV3sYqThN+YuM8jcJze9RMx9+4ArSkzla3oZIXCB870v4y6PGmOJID
 U3Kd6UEuaCue4EcoxiJ+dGKHdu1cfSETfd37xhrgjq6cGHTPU2eBRZy8m/RP49Rbf4Fe+UmuSSY
 QGnlQlNkZO5rdUrwVSC1NGyu6Ow4XMnzztbhT9L2JwHZetVy+n5995hxG+SSRb60Zw25eTNdjul
 +HvlLOiCNVl6HyQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX9Ff0JmJ/mfzS
 2l1LT0kokLLlSC5Zs3V6ZV3D5NjaZh4k+IRx2DAZkvRLqIgG+kAGZvQirnwvUX1KSVOFIvSJHoe
 gIMFkvY+823c5czrKpWqQ3r6PJBDyDbXE9O9aNQDEyfueuC/DxAUMBomSZt37lDqRXhT4HzTywM
 FYWOAcaM2hIvgQOVD3p9T/KYGloecTNbtkBo1roS0Tl3sUBhb8UwYFsToXe3mpzR6iHN7KZR97V
 l6FAREPuIaSZG/9zGLQD3wxr8w0nsUtSpWy45IujbiFvxixU5g7jGGUbMgyz2+0LtZvF9xWnqda
 rbV2eFJJUAu3JGYkgR5CKtqwqyaQ6eLDLtUE4EQCyk74JgGCSxdC7XII+PkSbyBcl504Nt6klPO
 tmEZYLyVQzbjDu+5QqH7Rp1VEmnY6rUyiVQQQ3tSDNngKloAdg1kUlb+uay2xF+xrReAHDP/D7R
 SnfUqNJXzEdDGlBX8CA==
X-Proofpoint-GUID: 3zFX1-wgXZVFxSebzOCLlbzyca9p6Kuf
X-Proofpoint-ORIG-GUID: 3zFX1-wgXZVFxSebzOCLlbzyca9p6Kuf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfXxeA8JMbqoM4d
 ODfiLB315q5bIq28qtgremMrjx/Vt9uo/9yy2V37D6+v7S6cbCDZe/Bz8r+0LH2aplCADGfrDHq
 0MLTnUXgvvaqIyVHWHk7K2k6B7ZAtIk=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a6363cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HIMiOIJdItjYp9BVDdsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240119

The x1e80100 machine driver currently derives the WSA RX slot map only
from the runtime channel count and programs that map unconditionally in
.prepare(). This means userspace cannot override the speaker channel map
from UCM.

Add WSA channel-map controls backed by per-port storage in the machine
driver, then translate the selected SNDRV_CHMAP_* values into Q6
PCM_CHANNEL_* slots when preparing the WSA backend.

The WSA links are backend no_pcm links, so the channel-map controls are
registered as card-level controls. This keeps them visible to UCM before
stream startup while still preserving per-WSA-backend storage.

Sorry for the late respin.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260723.
- Return 1 from the control put callback when the map changes.
- Allow up to six WSA channels for Glymur.
- Use WSA-specific control names.
- Expose standard ALSA channel maps through TLV data.
- Move the SNDRV_CHMAP_* to Q6 PCM_CHANNEL_* conversion helper into
  qcom common code.
- Register card-level controls because the WSA backend links are no_pcm
  and have no PCM instance available at card init.
- Link to v1: https://patch.msgid.link/20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com/

---
Abel Vesa (2):
      ASoC: qcom: common: Add SNDRV channel map to Q6 slot helper
      ASoC: qcom: x1e80100: Allow userspace WSA RX chmap override

 sound/soc/qcom/common.c   |  30 ++++++++
 sound/soc/qcom/common.h   |   1 +
 sound/soc/qcom/x1e80100.c | 182 +++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 209 insertions(+), 4 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

