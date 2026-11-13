Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580370;
	b=HNft7Qr8gTMaV7VW3OKYIvIWHdq+wwkT3+6LM+/m5OEeXy+WXU5ss0c2s3/UFCSjHrf3
	 iSm19ekW0qcxG03XbuSBUu7Jf8oEweOo2xtCyO9JxkwJiiQX2YrKZcAU+20FrWYo522x4
	 qWYmgT07l8amxHMF/Myi3kdvxCKzFFlJ5AwS0TYFQXiKgy3wS9fcaRin/Q2FkvXzYYceI
	 +VDC08vi05cbqBO5keol7gXK5Ppgz14chn6bzQe10gSIrNF14VwK1xjgoTZbabJQ3+G4X
	 IIkDPwbYB2IjmFuMnynJZEDnolOv5kV6r4VJrisaD7Erp3aE6TudjCUD91QIpM5xyZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
	b=f8UrKoZXrP228GQ1EQ8uSveIhsJhHStCAunz5Hygr/P+ToQEUCHvBhiwqFMe7iqNS6+C
	 75EhnQCipXhEnQbGGrxtljA8goFvfb8umKxnpHKU7lSTDor+5gZ9KBevnjPVQOCzgLSuV
	 FgkrE8epMngmrvHzmcLJXZz5McvqVIyKusYdJDw270ges0pEu6/O8tw9bOWqAVtMytz3G
	 R/LEx+xHhg1tBjbTqo1E5DIXpxIZcJq7RswCW3AtSiyFn6RAp2rSsN4d0nEfOHdMyWbku
	 orsYekJxLdknmJDsM0nPTRSPMm8QH6MYFYUT1ksz7xHP2qB93njdOcGn22VKYcqR3Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLa6u22w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KkHAunv7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B3B606A883
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B3B606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLa6u22w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KkHAunv7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJwrl516766
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1rjsZQSMnAfQ2xKNuqDsFY
	fnZ1wXBEQg1aBQ/7/A6tA=; b=HLa6u22wkwQbhtzocilLpOdaL41OcFYwoAwAkn
	0NLoL4GXoHwcp2KuMhTrLM4ZSpD9FcvlwxMtgxVhwoRLkM5cxM8JN016/kfl71pQ
	dbwFXK3I1WyDzXo1yHD7njVeZn+6s3Cbb4ES82JIfj2Lba2WRulmHhHqJM10xN7m
	rNdUq3siCq6jRdo/yi7qOM3zqx6R/Ao++PEnL07ZjK9za6TR6PyRJfKCXeVGObqI
	/aa8bN3kf2lC0SPmebL4fKVjjMis0luLRTCNlsHVNypl1Jp7UUK3+5gJclXMW/zR
	jqKzA/Zg4o+yVYQoeMHXDlucncp+i8f09v5bZ46IQxUDWl4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkjg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so186041585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580368; x=1795185168; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
        b=KkHAunv7+ZoEJzFDSgsTf8pMCW0XNVAVt4S9YnnStH0uw1Ne5L8PVh5zIhMSPP7JIz
         G373fT633YXavNT+ubyMaOZGtXVtFhrpx5F+BoAxDBkvUwCYSb9kuU+T4RlTjXkqUpAC
         HHkNfwBbTAOdMqjgcjWjR3QP3OqE+9z2Wl3YntZ4GquhFAkB3hnUWAoPwa9ZTe8Rot1X
         mHKCvqNsyOR2FNZHRHMnLY1GCoIaM4iVyXNT/FfdYi80PfEUm3ggVm/Qowoi9Qbwk+k2
         aFAAZtnq6uiI5LEC0+49jGzMJtHWV51fMmm108g0UueLwqH1q+T3AVddlzNvVU/+KhiL
         uWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580368; x=1795185168;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
        b=sC4nXaDQyBZsfZ4No+hUyK1MkucdyU737bmjEWO68789ILX92FTWV9cngdQzyCfgGD
         SiZFzvEw/4DrLtx3Jf2tsEtkwn+zf7ipKBe3r5fzCBRxPY2QNGJbjq+HF8SqB9sOIuXN
         FP3ZFCYVSQDQ6QS0HUuDDrpZ1hPw0PYNO3XqCGhSku2HUvvD/+oL0VBQ2aAMXci9ZUUg
         A7LwMD3oJA16wJGWoqKg8yWym7QqjGQlBlaEWBFWGyG0bIEMJwzCmn8+P75oU72TwGRu
         0ls6aBD9kd+l7osICNygSLUYAWcPyKJe1RcoBOWAeQQ/uxSvxvlAUfsaB86QoJIgUq95
         MjtA==
X-Gm-Message-State: APuU4Z+2Dn8c6h1Yuuc/aqHGfLY3yDg6+y9wmcHKhZTNmX3nZF4EuPPT
	UXDaAnzG5/ElOGeX+FfET7d2C6x0mKx+j4V+XmrWjzjOop+Gj67gAOb0w79osHI2kSLXluA6rov
	l/TF+hy8Y2H5cCCGaMmYsWIkMh1+vZLpkB0A3I5FKICYwaGdFV8SO5tTqGfEOF8OFLOVG
X-Gm-Gg: AYBFou2wYCqZeZ+AjRnnU5atPW/4GnWYrINGxJ1tqg1X92fv7dJl21hBYMxWbwnnVP+
	UNZ0w30nPKWpTx0wz5oavDl65Ltu5WEIz3gqkj0cfqCXoiGscgA8ohGEjpSYqxseF6zqWxA0eLy
	uS3gogSyuVYZ2pAzmss+xVINZE2tkxjGanOYBHwlgK6EWTWvR57COcLtmjx0Fr2T8r+8QGSh4s+
	wBX/0w1sTUsRo+XnriSL4jctonvoiSygILk1/d92x2FuJALMdhHx/IUbiONnvPJ+IV9uPAyOqO9
	l4ek8+lI6xrcMwEdtjWrXig+5UCDQxj+4zcceTmrAKczHm1NQYnk999yyQh4kTgvce5Yuhbz+W1
	iR3+yv5DXt7mcKiM0oiZyh5d/HADsdG3WfdIShWzo/8tposRWyu5ktK1wZI8uJCE=
X-Received: by 2002:a05:620a:2a01:b0:93f:231:9ff with SMTP id af79cd13be357-949330d5136mr931370485a.27.1794580368139;
        Fri, 13 Nov 2026 06:32:48 -0800 (PST)
X-Received: by 2002:a05:620a:2a01:b0:93f:231:9ff with SMTP id af79cd13be357-949330d5136mr931363585a.27.1794580367477;
        Fri, 13 Nov 2026 06:32:47 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:46 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Fri, 13 Nov 2026 20:02:19 +0530
Message-Id: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHMf92oC/3XMwY7CIBDG8VcxnBczA6WAJ9/D7AHosCWrVkGb3
 Zi++1IPuk30Msl/ku93Y4VyosI2qxvLNKaShmMN9bFioXfHL+Kpq80EiBYsGl769J0dp73g5Ix
 trTQqyMDq4JQppp87tvus3adyGfLv3R5x/r5kRuTIQXsPWnjnJG6HUtbnq9uH4XBY18NmbRT/B
 AkLQXDgEYwQnpRzRG8E+RAQQC0EWYUWTdSyka1V4Y3QPAWEZiE0VbCaNKDtyMf4Qpim6Q+s+X+
 xcQEAAA==
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=3440;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=bCiMZ8Fv97xxgaf3+Qm3LMt3WxQjKVUrKaptjBGkrrs=;
 b=ZZASSHgFd3GJtQJ8e2kQl+5d+l+L5ObyCc571PvEnLX1MmTtshzTg1vSviPldWND+mWQfIvy9
 DYeHYEugw54ARU8COxidd8BOyxxXTkKgEomv6PXMkQcvMDBsWG3HYXD
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX3ssfoc84qwrD
 vyLkG5vpkjG9rDqbb8KQXvpbk8Lf1044GS4/gH9aapzmSuMMo7QV1SnATU41ptSae11Mvow660V
 3Ywtj3b7+W/NCzJlv+uUayEn6zE/fkY=
X-Proofpoint-ORIG-GUID: i3SBhxjuCSUbhLXBU03vosvUZsiqXx2m
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af71f91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DOWZbCq784I2nnTUJM4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXxatVzqJeA3l7
 ZQxdWWpQkm2kIRnAKbyMgpjQovNLpkpfXTbVlWkIHNCk4VH3scxYYxxXfRQg5c9sQ8KQXOP/JC3
 h5xD3gLZd/qBvezgH72cl8xN8Dpda0LNqyop4PDW5HizHokGop6jUJk5YpBZPh7jBNvD6xUoiBD
 OiijUJGD8Soxqgvs0S2dVtvzgeGpmUhJWocbIY+qEgia45DRhFcHdrROBWkuqkn5PrL1DRx5qmQ
 JifdGc8OSbPu/gnWYJjL5FyZukUfA2QGLkovIcCe2egalxxUIRSAnEsEiHISeU+ZkgOi8JA/Tjh
 ATyGwztC/Q9s3ATeyiB7hjqa+sJPSRVNvMMbd4ln1QHgWjaKfnaZzr3EZ/ZVpzUH7MUxcpVo47/
 PMUHw3UxY/e1ar3CzztyT4uR6GXPK2PVzgATX576tp9EDhvYxqld5BrH35yzTO0qG7FRkYo3lxv
 ISLZE83MKnFaZSXGgtQ==
X-Proofpoint-GUID: i3SBhxjuCSUbhLXBU03vosvUZsiqXx2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v5:
- Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
- Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
- Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
- Add a description for each iommus entry
- Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com

Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  4 +++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       | 12 +++++++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 16 ++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 13 ++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 15 +++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
 8 files changed, 100 insertions(+), 3 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

