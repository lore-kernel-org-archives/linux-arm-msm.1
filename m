Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6293DA5A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651909; cv=none; b=gMhLFmcbp84VkVKbi/E2HEOm/AgTcpQAz/Ug5z8GdBYOnR3Xd+GuBtU8CSb6RlsUvqF3DpPxyZf4kj/SqMlZ1mW/ZBuDoQwTnYVtI0fxzHm3bKQysmPWT4IcdEPHYa1h4UMObhmsvJjbmSzB8gR7UEnbp4kB2GmpRk1eQ1LZolY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651909; c=relaxed/simple;
	bh=wvLhuh6D3zuqvJBN+pbjlmS19iG9iawqz4eSwrGU2Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f5VXPJwarqHbuqbAPSPWakF7W6ptPtDrqJQx3lEL9nuAFd73xMK7DujGiqStwxpxdFpQ6uFmwmDB0R5lWCyecuhuJJ9667F96jDqmp0EhHCFT/FHmuemjS3YL3u5GRExfxpIZyAwftSfduHMveodqOVevht1D5xTJw6rNnLPNnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/F0QqfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUqLjD3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/F0QqfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUqLjD3p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88I3b297211
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PEYAhQ3J8aUvei7jkz9TSX
	OAPoN/13pBNHNsOnjPUjc=; b=n/F0QqfPV4ukKPBRM05MIk7c06Z1na4KMQGzs1
	W6hM3DbMj8OCaK5ePFkxxhdDRkIhO5lCdkjGTAbsLYRnJb1pOxii9UUDzzaiK6B4
	c0VJFsIQV6KOnVcsxEiDn3/T4YOUNvODrsRMQgoWXzqZwBpL59/MP0mUcFSFrvmR
	g2zZ84gCJ6DceX6YFgElASKGScAOlcVwjb5guR02mMcTJdTvqBw8X71obJgOob/+
	zOL3QBisUUfGSqaavhoP/zzqu6T7jY7IK6YGiqEjbmiNM9cTTjgi+D55kqspOce8
	4Qfsw9Iz3ZoQdCd013JqnNWJgzRJvTSy2ZcMbo8wn9jznNtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93xxs9h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:58:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52cd0374265so85128561cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787651906; x=1788256706; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PEYAhQ3J8aUvei7jkz9TSXOAPoN/13pBNHNsOnjPUjc=;
        b=gUqLjD3pQZoow4EuDGjopZ0+BcFP4SKez/xBvzskqCTgZ9XkrzrZSjw2F5G2VqFKbe
         DYZaaKCoB/bOwQh/J5gnfymcydpEbAYiSrGCcfJ903ZS2yootr9G6sS/WLrC0xc4cAcD
         MYAEq019k2DUquyeLlZa8pxWjrC/xLsPStOmYYQKF4ux7aMTYIBMLF4TZFbTnysTLq6p
         OInrbJvLGOALrRtS6pS+hV1Mrm3LVk7YDO9vkQbK76U+agF1xujma3fgSZsZ3hc5J9w0
         VG1B9jd9y03D/YR0wegGhcWU/2FhDT9RfK0w7ILjcwqjuQvcB/CwCc4paNc8K2vaKgtF
         k5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651906; x=1788256706;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PEYAhQ3J8aUvei7jkz9TSXOAPoN/13pBNHNsOnjPUjc=;
        b=POR7WUhcrMWIWEmTnpkASfOX9PRdZ+CckFW/OAaA569oBVo2tTQT14bUAbtDo08DAN
         7sDRX9hbSu5XYwz7x4YgvEztEtbKRqJs1Drfs5kvqg7x3/L7OWn4qi+qhbVkCb0DUf2a
         P86wXje/AfzbGsbkYk3rGX5mZU4t54EuZ2003IHA4k0DkPOoK+pixZ4tolUUZ/LodXcZ
         RnqHAzXgfVox/JbOKP9Nu+DmIsNni7dJZqG1vVxrjTnNARxlwOyxsM0SlGMzGKs4DgsI
         x/JE6KmezwrSSUV89ArunqFS/hZXkrzgWQixSgHiOLs0jdbbleHyQUMD/MzdcHIh9kfu
         tD/w==
X-Forwarded-Encrypted: i=1; AHgh+Rrb1SYNtUUUgjJU5E/Z0LvGGr2gQ+LC5qODf972juezPUtpd161/JwBeWTy4fmzspJTdd8VZPyUuUXNHb6w@vger.kernel.org
X-Gm-Message-State: AFuF++l/guHvKtclvqocLCCbbzo8W/TPzeylRYoVAZMc7O3TxFroaonS
	sKtkb24kaU5+N7Zvwutn9IhKBZa5yJRghVajucxP8ONdLKum624/L81NcxBMbByD55ZSkbEwDvs
	uWeJE71BwpblVBOT6BN4jZp0haAiVH7PTRlUyXconTLO6mfzqLxqohC/GKPZFJELPx4qh
X-Gm-Gg: AR+sD100eD//AB48FWI/KVO3HBpVzaxP5CTHCMsEvsQlOvbnAX3rN0gKt7mv4wcHKWj
	smui9SommbtscC4T1gxXo86bZDl1kfONbLgIgmGX/zRnzvOANhLn7z/GXnyxe4m+M4T53v2JlB8
	9iqTQ3TBLZ44a7Jrcg4TevxP0gTkpjG5ys0v2bpv78M/tTMH2EoRjyCrTRXwuoAcxPF9EdyerYq
	ZsZ+S0RwXjFZd5JTCvxxi+MKCb7vgjhsMY0MJoFIUVO71+mqRCDZs4v0K2AEdCfZQAzX6NWOEcu
	fld7vUwxrSsR2Rz3mu4Enl9Im872wVgnkJdP1giWCO7GqAwwPRWGj4oZAf7eBQMXGFt7WnwbMGl
	FHeuY3Eo=
X-Received: by 2002:a05:622a:1822:b0:527:809c:f9cf with SMTP id d75a77b69052e-52e09ca6647mr259418881cf.21.1787651905921;
        Tue, 25 Aug 2026 02:58:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1822:b0:527:809c:f9cf with SMTP id d75a77b69052e-52e09ca6647mr259418501cf.21.1787651905279;
        Tue, 25 Aug 2026 02:58:25 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm1647264966b.38.2026.08.25.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:58:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:58:18 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADlnjWoC/yXNyw6CMBBG4Vchs/ZPsEYUX8W4KO1YRrl2ilEJ7
 y7q8tucM5NyFFY6ZTNFfohK363YbjJyte0CQ/xqMrkp8qPZwyfF6PoW3MjbwnqPVlSlC5i0gh8
 w1C+45o7UIziHssiNPZS+2pUFrdkh8lWev+X58rdO1Y1d+n5oWT7IJ4r6lAAAAA==
X-Change-ID: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wvLhuh6D3zuqvJBN+pbjlmS19iG9iawqz4eSwrGU2Kk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjWc+T3YLVy7r9vD6sgYajy2ci6yOv/K3hKxQv
 q9KsL51BG6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCao1nPgAKCRAbX0TJAJUV
 Vs2HEACaK+A4I/83EiwRV0P57i/GwKly7m0xAIG5Aw1VVhL+EwHrPZM/TCbE306JXsCv4vmaVm1
 q1SRgnQMmhvO9GcrfUAgng3FmM2q5kiORL8RAEsw9TF5g10kXH0in8uPFP+Lk48TuIZr3MsAaYC
 0ZZJ5126EpYoDfPEVWzhr74NYnekZnl5tnKack9YQ+Xs0Frwlu2N6GXym4pD8qklqeV0FF/UDSx
 NN5j1FlXvd91+IZC46ojiQ6k5HiXtlHnWQe70U4C7qazWLNrHaAlGLDHCn9/BQXajKroGEq6aH8
 On+TP4Cu8moIBsCPaSvrQuy8bOP/OO5Y9A0gpczQMenF+9nd/U29mdnScdKdtPi67q23eayqmmh
 mUXxf3HXofWmWoycscOr2f+QENNXTbJDjpZ9ms6saS8x8qPNS7y17EWxnzm2OvuNvvqcw7ZrnU1
 Xn24+ir6qoCOgX98dctvoqFxLeMwctC94JAMyxfTvKd4DxcU7ZExeUzhTe0knxpNlZoDK8zL41Z
 zMlhpeixhH5bauT/MgTEkiHCblCfO1CfSdL5nIL/jGunxZ1HnNwSvZOieDjYRpwZpZ/kQ9OTbly
 dnp3XSPKE4qRXhm73HKeFNS0hbx7CmnHX6bHtnamxePZcxoRmIVmmGrmgGiE7xuqSK6lZ/fL0eZ
 LLveVa3taOr5alg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NCBTYWx0ZWRfXzkEAnzKVFON+
 EgsYVc0hBN6JXO0c+xlbX3WbwxITBEgzAohUq6G2QzbkCv7eCP9cQcmRyl9C/zkFXiuv7P+whMt
 4fc586w6u2O2ktMi6V0MsZdo8OUxm8c=
X-Authority-Analysis: v=2.4 cv=EOg2FVZC c=1 sm=1 tr=0 ts=6a8d6743 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FqyXsmgzfy39onaLLngA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -qahMxifV5LaGY4-PXWbylf5PEi4QlnA
X-Proofpoint-ORIG-GUID: -qahMxifV5LaGY4-PXWbylf5PEi4QlnA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NCBTYWx0ZWRfXx73In3JYa/oO
 OUHKm5Buo+dlSOLl5c+AZuQaxCpQ+RcrI4xnV5PxOQ8PsnuYjiYZvP4ziZ+Ps3UjfeJszaZgbio
 iJPJxZ0OsYTNeDypXIjXQrvNqMA5yhX3RcQc0yTdIRcdAgbF18kEDanlCkLjzJQNfqJ3zyWT++l
 zR7/6Mri13KM26K765jx2qtU8t2jgcMEj4VCvlnNi4ziv4nYRWBH4dKR1hhA1i+GcKowv4X3DNe
 VhCQWWa7zHn6ZXiK/okthPCQfGFE2P9e2Ypi5L00RC3FP9tx+TY5xPw9Cu5wJt3X6Be452B8K/o
 cOTGlzgd2lPdCvEQUIwM6y4/Oenblb7vr+P6lHTsswPVrZZ/kPKH9I2irV+W5sy6rnDVUhkVaUB
 3SOlXNpGPr1fCmbVgViSqNkHeZwNqOq6w1J72FowBucl51p0R+zVx5cerBDaa/Lae17LMvLhkvr
 ZEbb3NT7SJ5j+Z4xCyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250084

The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
the USB/DP QMP PHY. The corresponding GCC clock input was left as an
empty clock specifier when the USB nodes were added.

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
propagate to the USB controller.

Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..2e0fbbfcc47d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -655,7 +655,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
-				 <0>;
+				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;
 

---
base-commit: 4b18edbd8e70f7e6860d56370f13244896d0f95c
change-id: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

