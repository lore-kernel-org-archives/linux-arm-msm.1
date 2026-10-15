Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE840963A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055739; cv=none; b=WwBt1Ln7c0LDKZ05NyFk0JGa9QGED70fYdEZKXac8HboO1hLfYzGsfQAwQtxQ5VslWJ2lAbmJL/NN54RAQXv5r1y/kGdRm5UiOoaT0AY6MQgATty6RwuGLwSypwh8bCzPsTUkEFUfMeQ8/MLCYjB+E582C1DD2mlWUkbJHwo+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055739; c=relaxed/simple;
	bh=SAZiJgOhlwllm0S2j4x5zt29+UNZKWd0sSq869mkUX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VX0H1ygyRVIZ7JHYNBQ7o3DAf9zeZcEeVsMbsnS9F3eIdCzAXWylG/tpGNl0MrBJ7MEEvmuXJ1CU4FqOAgIHPFEiu6wUiSLX28o5V1ZzA7XGiU4tsrfHv58D6VkWDmT5LkVlQMV1Xd0mZk5/+bbZG2cbipvCXKiXdcgDa+2u1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLS5QHQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXPkgMSh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLS5QHQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXPkgMSh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F81h6r3468853
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=woXKUhGLmE4bOAlEMK+/5r
	eDN4SYGO3zQeVkhZzPyq0=; b=oLS5QHQl3od3e8Febjbn6MMNRB+Ao32qLmVhn3
	WNnjjnaLellkm1HJJEcs7RtT6medOBsqtnsmEGjPbeBSatxSVZlwe9KkzxcqITiH
	CC7R6yJQpnP1nI/MmJbLbKibAA2HUM2rjdcpwwIAWdzK9ijEK9/Io2ZooGwyzH0B
	1MthrGFdGJ7i6lDPrtP+1zo75CqRlvZ41aHHhW87h1TlbLmeBZiHs8BJGb7Rvx5J
	lwOPvxPDt5K/Nr/0JoklMl2Wct4mYAXyjjUkwMG0orSEUTYwbsDHhMcY4IuntTBe
	UMw/A13ovliMmHYsBBR+tisAeBieNNb25j481xR9yrqjypRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bfjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so5529632eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055737; x=1792660537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=woXKUhGLmE4bOAlEMK+/5reDN4SYGO3zQeVkhZzPyq0=;
        b=FXPkgMShxsmLQGt+pEKlEchus6JVXybRsbDBrkhIJCV6Rz4lqHyDtssEBYj5Le3nPw
         nu2hlTrlLEfBjIV94Xl+arXbU9vXA+Ymu6eM9gEXp7r3/6wJ2lsU45vIqQDIBT4n0TE3
         jJdVABZ2X2p9mtOMJSskUbEQ5ZRsEYGNvJtGcfn0Lm/2TC8/S6VTfELg+C8N89Z6wSG6
         qHnMxP72ekwxPGvlc5JErpMePH879uLyuLMV7HNPILEOXGLHxVDgTvH13CPaUZXKoRjl
         +xyStJ8MIRCMT+TomMXmsgr9eCZ6CiqCE9Mw5a0ee16RzrLoJP48Ew4DOKiyB63Za5Vs
         Goig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055737; x=1792660537;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=woXKUhGLmE4bOAlEMK+/5reDN4SYGO3zQeVkhZzPyq0=;
        b=wW31w45AMaP1lC0IZdaQ6TME3KYHngU7996BHfoZtXFDL8jImUMwek8J40GMGr+Y6L
         Wo0/3ZmYCh4QhLG5JM+1q2GJZa9acvia+VbhjxbY3RcqTwn7tcq5v3PlsXch1O/rB0nZ
         vmYL+kEQa6WyogUmYrLBrJlynY0kU6pqKcKb4+ZBYbiDcotBLxYLQEPQBpIJ29gJKuju
         gzIdsPCpCz1bStSWAkMdUz/JgLa07BI91rU0Y4MwLtimd6vrLACCVm2LUMAe24PI9Oow
         mQU8QVlClEtJz4LZMtsF8zKJcBhIkgBidmZc4eHb5ooV0nXbmvYO4bujDa7P+7CFY6PF
         vZ6A==
X-Gm-Message-State: AFq9FYLIeDaxzuGVBH9POb9KPMUC1OcHXVgIfjyVtBsNk7F8LHA3osbt
	5qmXDv1lGHyW5iHQR9yrYVRmIKl1jBdPfvHfBqtQF16M5tZb1Gpt7D3JspW5y0QAzKt7RdNIZqt
	emrUw6e1wkadCBtxtWf8uPXVBTph7b+mD2MfE9K1b4Px35EE67TR1SH5Cy4KZDHtgU3LO
X-Gm-Gg: AYBFou2vqHU2OJEQve9T9vyTx6TtkxMhWPEugPi4gSD5s9harrSX/cS/rjfO90nF37V
	z6oXvLc7/529/FCvQxqLLo71dVzlVMmKnq8/Ln4WQtDc+5931aNK6Obj0Et+8U+CAR8kR5FmWT6
	EbPIobakecuBZLL/h6A4aB6GnD0SKoutFPGmrWmLww9GXyd441SFv8iPZPnSTCrXvu3CHerj2Q2
	m3dOwhnTlS4G4cvisvYjB9T43GrQjhkAM1pq9X6zP4XL5uIrifcEhL67hbYfDoAWDWtsB3aoBjx
	P3wKCV00aEat0SriXNk1Y3fAmpWY9SY6kAMpetK1lzz0fBT3xec9b/XP8OnZmZi+8vNcWK3MMRU
	t8V4Cj9N5ifONCrfn9RVvflQwkg==
X-Received: by 2002:a05:701b:2511:b0:17d:7b45:f907 with SMTP id a92af1059eb24-17d7b55507cmr6057752c88.33.1792055736891;
        Thu, 15 Oct 2026 02:15:36 -0700 (PDT)
X-Received: by 2002:a05:701b:2511:b0:17d:7b45:f907 with SMTP id a92af1059eb24-17d7b55507cmr6057664c88.33.1792055735222;
        Thu, 15 Oct 2026 02:15:35 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm19671658c88.6.2026.10.15.02.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:15:34 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Subject: arm64: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Date: Thu, 15 Oct 2026 14:45:27 +0530
Message-Id: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+Z0GoC/5WPyWrDMBCGX8Xo3AmSbI3lnPoeJQcto0bN4kSyn
 UDIu1e2W1roqZeBD+bfHixTipTZtnqwRFPMsT8XUC8Vc3tzfieIvjCTXCJHoSHv4yEZuPXpAGR
 ahVZhY6VnRWFNJnD96RSHWROcQ+VrY43iqvNeCK5kiyQ0dyibgi0Kr8MsvSQK8b4UedutnEf7Q
 W5x+vpIdB1Lw2F9+x23rf4Ttozpav49xg+wjs0wKeCgyQRU2nCq9Wuf8+Y6muMctCnnx0AgHIc
 OhXAwtTAV5FBK8EYG52Wj/kp3z+cnGx9/dXIBAAA=
X-Change-ID: 20260618-shikra-work-ea756b564b2d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792055731; l=2870;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=SAZiJgOhlwllm0S2j4x5zt29+UNZKWd0sSq869mkUX8=;
 b=p0bLph7LW/pNT0BCMfS3zf+EIfnhwqNZoXfvwP3nxKQSlBHthP+/qTqFJR10PjgixHoh55X4H
 nbn68O8FkTgDl1zi3g5P4kpAVIx81AhKlNmdwY75YGr3zKtjQoXfNPx
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad099b9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AcGP7lXX_YB9EEKc68wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: jr-3qqXfAEEodHWz3Py1Gdav378wyr74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX8YGoqR5X9vL5
 4G6CQo3BQDvFayegp0y//L7jWQlz6ZeFub5ToYc37lPVCyPrSpLCd30KH2AGpEQlBkLK4s3qm3t
 XcTSVQsj1hah8xNOhj3UUWQev7ertQi0BMMFauTs8kEMvsgegvjok3sb2+2emhjKoL01PLaoraU
 SyfS/sxO6GlVJO/Yz3GbGOeT7cSQlQQ0XDYsB1Fs46BmszfTnYcpPCpmeHADTAAgoPGgEnRDoeJ
 /TXrDGIS1cPVPu2giI1I7PuIyEGnvoRguT9LAM8s2LOfmrJjiOIW87MXg7qYXpqz67Sv8xDPPeT
 X2H+tR1/iM5GYB5qxc7ujSqF2XcH2lAsprH8GLU3zapOcleChKZ5ZZ5w2N662uSuLOEhounr8nA
 4sjg3b35fABk2f6HC/GkNzWVnc4IDIiK5GRxGcsk8M1689UWZL0gTd5/XBKgaICkOIveFD1n0Ms
 lp8h8VZ5TPfdaUdW4rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX/UcHHXU56rvR
 6gUF3lBaUATy5yJD/7qACOLpooDkPA0WK6xZVT+xyjKtqYkPh44R9xzTae4AHJrE5XSmPgDU/SD
 pVo9Q3bwZUdLZhLtDFkWUg3y9RyJoD0=
X-Proofpoint-ORIG-GUID: jr-3qqXfAEEodHWz3Py1Gdav378wyr74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

Dependencies:
https://lore.kernel.org/all/20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com/
https://lore.kernel.org/all/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com/

Changes in v5:
- Rename node from lt9611uxd@41 to hdmi-bridge@41 and add label hdmi_bridge
  to decouple node name from the bridge chip (Dmitry).
- Rename endpoint labels: lt9611_a -> bridge_dsi_in,
  lt9611_out -> hdmi_connector_out (Dmitry).
- Sort &tlmm pinctrl states and pinctrl-0 by GPIO number (Dmitry).
- Fix defconfig commit message to describe generic driver usage
  rather than Qualcomm-specific board (Krzysztof).
- Add Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
  to defconfig patch.
- Link to v4: https://lore.kernel.org/all/20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com/

Changes in v4:
- Rebased on top of next-20260929 (linux-next tag).
- Only two prerequisites remain: the display v5 series and the LT9611C
  driver v16 series, as all other dependencies have sincelanded in
  linux-next.
- Rename lt9611-specific regulator and pinctrl labels to more generic
  names since these will be shared with other display interfaces in DT
  overlay.
- Link to v3: https://lore.kernel.org/all/20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com/

Changes in v3:
- Remove superfluous comment from pm8150_l11 regulator node.
- Link to v2: https://lore.kernel.org/all/20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com/

Changes in v2:
- Removed port-select property.
- reset and irq is aligned as per driver.
- Rebase on top of shikra-display-v4 series to pass schema check.
- Link to v1 [1/2]: https://lore.kernel.org/lkml/20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com/
- Link to v1 [2/2]: https://lore.kernel.org/lkml/20260618-shikra-work-v1-1-dc30381263f9@oss.qualcomm.com/

prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-message-id: <https://lore.kernel.org/lkml/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260618-shikra-work-ea756b564b2d
---
Mohit Dsor (2):
      arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support
      arm64: defconfig: Enable LT9611C bridge driver

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 110 insertions(+)
---
base-commit: fcc65d3aba5059dd1105276e180c624110761d8f
change-id: 20260618-shikra-work-ea756b564b2d

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

