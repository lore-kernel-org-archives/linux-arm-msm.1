Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343C35E1AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846757; cv=none; b=mRPaqMcc3Rk6bPc0meUpkn6kxoEtmwNPzolLSLd0rX6KDaV4b8FdYMi6MscI80YVEpc9SO3ycqzufm2YyPQVwo4sRbyP+JJq/qeZaM3sDxAUN8sUHiavmL8n1csL3TNPtcafy9s7AY84HMOB4RuQ0y+MC0ixrjipZEtEEJXwj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846757; c=relaxed/simple;
	bh=UQFiLl7rsF/Fmo0bCFTVlbxdjX6fNtePyw7SzgPkWNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RAojOEN7/krc62GLILnOlP+0NuiVlDXBczpnNvnBVinbYXXVXBFlS+y84zla37wqHiNY1x0FKTYuHmlEZzxFYLiVREXS/VMimbDYPJ44l/Yz7c5Pf8/KDuso/qcMl0uUJtqSUI0Nm3cMl0a5gk1TX3UYVGS6VtMUAULuK1S3bl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1gHboA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxzQq1aV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1gHboA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxzQq1aV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748Bt2v3016124
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 12:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NKK9zzylXUCpx5WJ76ms5m
	Mf7+63cI4aasBg1+QgXAc=; b=D1gHboA7AOIIHfN1aKlr3HRoAYiYmLzdWJYtrd
	ygskirEaGeWjsLqdhBi5HYP3fWEVaMBqsLrWif3TcRCnKU/q7kZ0jlIV7pRQC2kg
	7U/5cgqF8duFg+GgbxiaiBy7BJZV6vT77MLq9fccIC7yz7TE+pFev7N1FXoc9UTA
	vv8B9Jsx9LtFR5vQzUjX5cSDsCWJVwkG75zXTViiNX7qXmDCuft0sG8xMAgQYPMS
	XCP5Mg0ftpEuAJNbE/+gcanZU90ROppcSAiM7gbow6G2n+GXhli6j4ieP5hXgt3T
	FSFyLIaELfefzjqhcN5eTYkLshlapTY4r0fYDCt2N/jZNmiw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7272bbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:32:33 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9ec696003so471283a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846753; x=1786451553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NKK9zzylXUCpx5WJ76ms5mMf7+63cI4aasBg1+QgXAc=;
        b=DxzQq1aV4nq78L9lS3dfulRQG3arTYboCssDune10jVf580OU7AY1AntpObThaBv4J
         4DvCZhRP/sv8a3srvfPE6z3bVxohuIfd+DCNMsAjlI5OOjpf9RMGDvQcMWKqh2gv/15x
         K5mN+PUKX7yDupZ1AqcuiWLnLn4si4ffU/oyM6HkHDnvI8b0cUfQ6SuueppMeN6LtTjo
         WOB+/Yvlt4BiJ0i59PybMFW+UytVD0u4oVZGzC90iXincqn9TI85RNEhwB0twCQvnHjt
         VWpQAzVGt5+z0vi0HDAwele26whGH+QYo2hyqpukrJmcgxHH7sNoZw8ggUTpsW5bh590
         LXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846753; x=1786451553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NKK9zzylXUCpx5WJ76ms5mMf7+63cI4aasBg1+QgXAc=;
        b=DuoVriS8PkW6Qd0Lmonfzh5RURBgZRe5nDxbrVNqLmi7MrMfnt4sSL+T3Wa8/1LhM/
         Ln0/6X9aLd9kDb5/+lKV3k/6VrZTizAFPKk6f/H1K4DcxbHRTMJJtW97SwnQSVlGcYj8
         wEvkDc8gk3qM6+HSTrOZk31o1aH+f+DLjVJdlwjW0biXNbuaA0TCMIyzIZT6D942ML/Y
         9ccXFrl+vh3yEIzEv/pTP+i9v5tS/8x9WF1Li8uFRd6QwYYuRdpYQ2l/qRBNQskMXMAv
         93nDvCqJ6YNzJY3vaX6R4P1/g0IBqj5GIaNe3uueovgfXz/+OJdjR+7XuQWhAW3Ew/OB
         kO7A==
X-Gm-Message-State: AOJu0YyMWSF+Q7FRYygGtg13FGMKh5/DWK2cv7/+ab5slGZv/StC5hWM
	vTbbaZtA0B9AapJUzFLu11TdmQvQW65zdDTSeNV4fmC1wYs07pzEid/t0Ag8o6pSd6ZTkoLQ9el
	EA8R+oXBlq7BIShNg5exAnALqiP7Bfs4zxS79G85OnGMMpx2UunHnhbmxm00UNYgFGkLT
X-Gm-Gg: AR+sD11V3LbbecbZdfNftF119kRu0vEcbQQh2OsOkLsVMhvpaRFqjpeQqzVuPNtIjU9
	8ZvUxbi+ORx5hTJkDM/pSIEKDjdLCayJgVEynoLZgrR+Zr05d2K3QuVT1sTb+RkN0wchuJqfD7T
	+J6fIb3XHV1FoZ6g9z9/iNrpbhw7IMJqTctb1Tt08Cfhi4P828A756HC2umLuXjNxx6qJNUwf0y
	2cUIijgrB0rpA22nPnUJToRjlDrhThbTgAOYIkYRc4TS9bkwYXwdbzHrp8vK2HTpAkaafuoGBSW
	RkZ5vTlaHw0tk2B1CGVg4YYzxyx0KPKmylIsFMVQvvUk1NWJeG16g6p28rsrGeIOoNIZqTMu9gY
	rqN9hjdpRrjgju9JYMZthPTwGtpUaoafxGZE2a0XwL4lFieyaDsQ=
X-Received: by 2002:a05:6808:1487:b0:4a4:da68:943d with SMTP id 5614622812f47-4af5e31db0dmr14240777b6e.3.1785846752547;
        Tue, 04 Aug 2026 05:32:32 -0700 (PDT)
X-Received: by 2002:a05:6808:1487:b0:4a4:da68:943d with SMTP id 5614622812f47-4af5e31db0dmr14240754b6e.3.1785846752028;
        Tue, 04 Aug 2026 05:32:32 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:31 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: hamoa-iot-evk, purwa-iot-evk:
 Enable M.2 Key E connector
Date: Tue, 04 Aug 2026 18:02:24 +0530
Message-Id: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANjbcWoC/3XNwQrCMAwG4FcZPZvRZe3qPPke4qF2nStYq80sy
 ti72+0kqBAC/w/5MjGy0Vliu2Ji0SZHLlxzEJuCmUFfzxZclzNDjg1XWMOgfdDgEbqRICEgb5R
 RAivZtCxf3aLt3XMVD8ecB0djiK/1QcKl/W/l4bBFlEKbilf9aR+IyvtDX0zwvsyLLWSqP5n2m
 6kzIzpl+xaVkEr+YOZ5fgPioOhb/AAAAA==
X-Change-ID: 20260723-hamoa-m2-dts-v2-2067c7421569
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX2vaKp9C9l+HE
 eRM22SsT9S9cUYQh+PAbsHDH9o28YxzJfNrJ3Z4CdEADymQoSosxPK+xLHCmuhRytYG6WYTbXww
 6kvyO6csDjzlC6wU2hS3Q3K7ad5GR8Y=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71dbe1 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xQ3PatI_n2DDq3JNOUQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: PEcairDmB5mrhYeSnIn_NMunHrlaBm8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX424Ne8OsArqG
 pD/FNDrVxUq7dARWy3/gKE+RZ6j0p8MwgIdo9CFD+fEFcwOMB40R8Em4/IrHFWpvOvAu4kKmp8f
 dSSd/PRRRM1YBbNd2OVXopaRvUSXgHbOhjEBiDYBEZQ8bS/7dLYGS66hCHnTutHF0QmJWkJ9TfG
 CUHFE/UFKMhdIQOOoov+vzJgo6U4Qx9ZdVaUYT5J0g8mn2ZolBcjkeC2pXRKpGnHF0laCCaslYZ
 Idgm+DJUBMcbQy1XvHfd3MpuFLDvVMuvCWxymdIQ1J1VZ0V10EK3itWjI4HQmzIQ3Pue469kJR6
 ajvyY7UiOCL+NvOzvqV6gWbJ4O3lwc3jm+uvs2UThDsTIs4tbDy5pYHnfGkzMVSzhVplsgLYY66
 q+R6A1REJOomlLQp/DMnZ6UHfZuSOK02JMk+lkGEZsO60zy4TgY3qSTCT5myv+lb+3E+R8L4G7b
 AxLFM4ZPNRMBeNGEEPQ==
X-Proofpoint-ORIG-GUID: PEcairDmB5mrhYeSnIn_NMunHrlaBm8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040099

Describe the PCIe M.2 Key E connector on the Hamoa and Purwa IoT EVKs.
The two boards share the same M.2 wiring: PCIe for Wi-Fi (via
pcie4_port0) and UART for Bluetooth (via uart14). Purwa inherits
hamoa.dtsi through purwa.dtsi, so the endpoint stub labels and the
PCIe root port compatible added in this series apply to both boards.

Only the UART BT path is described here. USB BT variants of the same
M.2 slot need the USB core to acquire the M.2 pwrseq target, which is
being added by Chen-Yu Tsai's "arm64: mediatek: Add M.2 E-key slot on
Chromebooks" series:
https://lore.kernel.org/all/20260724084328.3943997-1-wenst@chromium.org/
A follow-up will wire usb_2 port@1 to the wifi-bt-connector node once
that lands.

The pcie-m2 sub-ID patch that was part of the original series has been
sent independently and is already applied:
https://lore.kernel.org/all/20260724-hamoa-m2-sub-id-v2-v3-1-af97de70bbbe@oss.qualcomm.com/

Changes in v4:
- Drop the usb_2 port numbering hunk from patch 1/4 (was "hamoa:
  Number usb_2 HS port and add M.2 endpoint stubs"). port@1 =
  usb_2_m2_ep hit the snps,dwc3-common.yaml "port@1 = SS" schema and
  was NAK'd by Konrad; the outstanding binding question is discussed
  in Konrad's replies on Chen-Yu's V6 series (patches 6 and 11):
  https://lore.kernel.org/all/c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com/
  Patch 1/4 now only adds the uart14_ep and pcie4_port0_ep endpoint
  stubs (Konrad had asked for these as label references).
- Drop port@2 (USB) from the hamoa-iot-evk wifi-bt-connector node.
  The connector only advertises PCIe (port@0) and UART (port@3).
- Drop the &usb_2_dwc3_hs endpoint override.
- Add new patch 4/4 for purwa-iot-evk.dts, reusing the same connector
  layout and the labels inherited via hamoa.dtsi.
- Drop "Depends on:" — this series is now independent of Chen-Yu's
  MediaTek Chromebook series.
- Link to v3: https://lore.kernel.org/r/20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com

Changes in v3:
- patch 1: add uart14_ep, usb_2_m2_ep and pcie4_port0_ep stub endpoints
  in hamoa.dtsi so board DTS can reference them by label directly;
  remove superfluous comment (Konrad).
- patch 3: use &uart14_ep, &usb_2_m2_ep and &pcie4_port0_ep label
  references instead of re-defining port hierarchy in board DTS
  (Konrad).
- Link to v2: https://lore.kernel.org/r/20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com

Changes in v2:
- Split patch 1/3 of the original series into two commits (Dmitry).
- Add usb_2 HS port@0 (new patch 1/3) to pair with M.2 USB port@1.
- In patch 3/3: rename pcie4port0_ep -> pcie4_port0_ep (Konrad); add
  port@2 for the USB BT variant; remove unused vreg_wcn_0p95 /
  vreg_wcn_1p9 (sashiko). Konrad's v1 Reviewed-by is not carried as
  the new port@2 endpoint and vreg cleanup were not part of the v1
  review scope.
- Drop patch 3/3 of v1 (W_DISABLE2# else-branch); the Chen-Yu series
  handles it via USB pwrseq (Mani).
- Link to v1: https://lore.kernel.org/r/20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Wei Deng (4):
      arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: qcom: purwa-iot-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 130 +++++++----------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |  11 +++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 129 +++++++---------------------
 3 files changed, 74 insertions(+), 196 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-hamoa-m2-dts-v2-2067c7421569

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

