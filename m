Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583112;
	b=eYUBmgaPV8fc8yLvMIWp3JiQ5b8P0j+hmckT6iEU5QkutYqBX8S6TYGv3XoRaMY5IRuv
	 5C7Nx5E100Mp7aRfcsdmXZbJUn7V2gwN7jWLHTS+7gn6VPgOsIS0PPTCoyBZpn6okJWYt
	 XBfcmDDTeJiVBjHuoTFqz4l2NjiDwmaKOO7rfKuv+Dv8YsJjMfw6sK1BIcI1NyXAhmQYt
	 NCedvGNXr2apcrBjIcek6rZjuWFdLPDmADhnuWjOpC4AW3JCfGmn4z5I4+uAjINGIX3DG
	 4KrVbcbP9mY50B7Qne0bWxHuySCjiNXaYdbk2rm0De+SHOMJzwAF5tPSe/1O08bFclA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
	b=zJSQXB6SAxAhb9ySv/1h9kJMcc/NL5SgAuRJKMIBVdWJ+q5rRS5rqZjxzCS/FfRNlR9K
	 3ZvhOCF+Fnk+aD3s9uqJPLDjlb1GWR2zLVW7jN9t3/uV4+vcWVHBtxSPTptz+ENl42cmr
	 Tm6TC41lAookPNaEh1W7/vqyrRyZ53LUQfDZ54zpLHr3xbWdV4BhDnrDW1vHtcfLBg3eh
	 u6wPgex6p3yjXW3QDhcvA+Mj7Ui1qEvNvPnNtFeakcE3m8gNRuDiUz9/33mSYRr4h19kA
	 ielPoV6AR6giMLycJQv8RjT0ihgWofunkkmjJktyUNQ6pcMo8dSi07TUlNghsXOyB0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mf5/vKjC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3U7ZqoM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA4E606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA4E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mf5/vKjC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3U7ZqoM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg9Gl1054287
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uw8HOn1p1eSQSwTBq8Y1Cu
	ifynw+A2KsCcsyQI9cCJM=; b=mf5/vKjCMM27Gsa9nkwo7PjQ3a1dhpNx7+mLDz
	avt+TSZTRK4Db1vKZuhKdFAuby9a2cRtehLLh7+lhIe2WcEU+aH0VneTLnbXAFO6
	xXiB81MnnhEodvjaBD/jyJvUrukgOHZgJM8bOgOCTl1Le29LsHXNvP7yPQ01ClBm
	KTJZwozqG+32htp9tAT9OOo3gUjRcfNavoJ1oK4oxRdZWbHwVf5h/IQXPXwtltUk
	1xkIlf8qhQcse+K5mY+gMuTRH1gsHwwrQAvH07MmH7Ga/ZRosemfcZextZixAfv3
	o1OlqKncKOs4brOuuDrArNbXtv4TeZjQw2Um4/nbqaEEzsPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkptk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:45:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1199246eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583110; x=1793187910; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
        b=h3U7ZqoMlr6lxUu5L7SEDNE4/cpnHk3QBbO/7snjZwY2V2Jg+cpcrJJkDJk8cdEmYt
         aPiftG9O9kcDHIycgWTD73SVyt8o7YWnyga8NwORycOFpMYeMEg8kd2mAW1/wWD2zDu+
         oNvFe+4oiI/orizm9xRPv253Yy+9zPvY41472QICwPfdJcZIClYyW4pIzqRF3kXH8oxu
         FDE+deLmVSuS8SM3nE4Q5pFA+F5xCxRSNBAAuHboFl20MV1HaWFTfE3TMNbrzrAIqgw2
         9cCzRYrQPaiBmiZ+79WCvA3EIi+rFzgk9vZHaDccDFYUlhVBJhhaV/De0EeOfuOIaTid
         nHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583110; x=1793187910;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
        b=h/V8uRxcv1xq5lJvsmX+7mGNx0h1ZbAYAaG+Ukd7OvMBucYdAtM254LReWm1UVuBSi
         LIJcoq8VmjNLmB5FUWsXg2hV2kfVOziBHc9pHMPi+rznHT9ocGwWVDwjbEtnGWKGCZWH
         gwsGtv0SDg0hMrL6clD7xcSxARijlKxpj1njDuFSmbmae9KS2xKVQ2hC47KlVcKyrjRC
         rKNC/6acZ61jgqKNbUtkN0uWGf6Bb9z6Y8AU1vFduqJVco0KnF0MNnEuH5EajJMkx/MF
         GNOhUO48i9XjRphVePTpnggwmj+ZcwBn/G6fuDUzePogk373RvFXQ9FLwuPywlVgcqW8
         XrFA==
X-Forwarded-Encrypted: i=1; AKwUvBy00I0Lp4wBlSPsNKksVK5Rp6XqFZu8pcslj0X1oqIdVXehEs7KAteGtneIInGVl6+YUGDruRdzy25XoocX@vger.kernel.org
X-Gm-Message-State: AFq9FYICeNgOG3yewSn2QG772bwp2GZr57fmnZ1nSZisOBGe2QZc/Udc
	Ji0KPkYoPIg8j0cckfpUPNGYp9E+8Zdfh3lgS9wZRi2Ys/dSrkjODZWzkTcmSJttyz7hD95WbY1
	+AhE7L8QulNZEv1+Fo6LweBJ2HBPhP74cQJWF3MAlLXVWVbD75dQxOdR0MGNF45Aa+3jD
X-Gm-Gg: AYBFou0iWBKRSnfK9tky7HJJi/Ak6Rbr3/Wly3S72vOpRcmcKfkg+oI91sqzCV/RY9z
	CemXt+TdAMNKWF6aB6zb730d2ZKI7S3Vdr0x1QQaLBEpMBW43t6XYKN3y7IlSIBMk3Ap46w8Cs8
	Da7i3ErSAGDzaTk1g+Lp7ncipA7ERn09lNXeimIzOAumtpjOsg9bXRJwCqC4Uske0S59/AS243k
	V+jbwhyGgY+Wgi7X237e6LCI/VBZKXSpNtwMbBdClDvykOCiJqXTsp2j4q+uhgShiaL+D8rCZDf
	xM9fUb+vJje3uC89xjZGARZ+JfwEkbSUaWmJW6Jl7YvSZNLIFPPNHSKb96pSDRDrWAbYms7ifhE
	+JtfwlnizRvSpIKR5q69AmiCqO2whQkM=
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3674f2250dbmr2595175eec.40.1792583108971;
        Wed, 21 Oct 2026 04:45:08 -0700 (PDT)
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3674f2250dbmr2595123eec.40.1792583108246;
        Wed, 21 Oct 2026 04:45:08 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed295sm7556732eec.9.2026.10.21.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:45:07 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:15:02 +0530
Subject: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
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
Message-Id: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL2l2GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyND3YzE8kzdogxdEwOLJCPL1KQkU1NTJaDqgqLUtMwKsEnRsbW1AP4
 M1K1ZAAAA
X-Change-ID: 20261021-hawi-rh-408b29ebb555
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792583103; l=1802;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=TzY/8yLb7ebLKUf0lf6FxtuE/z9EmJHPGEB+lGCDCOY=;
 b=dKfV/PdNOkQZRAlrWVQ3ZwiknN/YmycciTttmCFN3Apbes+kb3h4kBbBZ7+hzkEym6bVUmcjc
 GDR5dAcnfWVD0H6wOeDkgudDK7gA2M8JE5J3Mf7UcChfUVsqupX0etw
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX+W/KI1CMngNp
 wrcfi2unbvv0Nx+J8gBo4D2V5O6GcD5aomwNoNTCCjfT97EvPl2cPGmaJ7oR9aunEOjR2NL/qdu
 knMHL2H+F0T2Uyw6L5wRBQhntTMhjlZ95/9TJzl1lQK2wY7p5qBYV/F9iQQPOpiaEhXeJVjWN62
 nso5pYy+Jiv4IqoF0YjlmZ2iWONua4SS7beydWHawJP63g9fr4kq7lpCPoMOko0DTrSf0AF3O2D
 BSWvdzfDAYUpM9adlNvDvkg4AmJdBlZ9t1kFlfoS3SMmpjhoR/IvyG6YesAlXxb/QQRnc9zS5+S
 GgGzKcwIJVXe489jQXgSZfHs1dJgW9yMeR7b0ITPjEm7sdExLV4x1WaJjueFkGx910loqwm7FpQ
 8+e49YzjSB7XUJ5TbE4KYHjaduZKsW9EJGeZdVefPhuEgZq25Gn07BKTTgixwQuljX26qE0K1iP
 mooAuZNy9d8QwdciUcQ==
X-Proofpoint-GUID: A5DxK31Yr2tXx6Y7klVzVmeTDf1zcgt8
X-Proofpoint-ORIG-GUID: A5DxK31Yr2tXx6Y7klVzVmeTDf1zcgt8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX4ibIY2s6ioBF
 Zxmt0INN1G33uRpA6etfxrtk43sl0qP22DH2FLSZRWKCHSBcSiyHnwMgYkauN4P2caK3D1Y7woC
 HL4DZ35YKTzgiSl9PnV6ayVUZ/PDMrQ=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8a5c6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ecT6ZAH8srv0KshgsUoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..80cb00eccdf1 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -441,6 +442,14 @@ mpss_crashdump_overlay_mem: mpss-crashdump-overlay@bd500000 {
 			reg = <0x0 0xbd500000 0x0 0xf00000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3781,6 +3790,9 @@ fastrpc {
 					compatible = "qcom,hawi-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-hawi-rh-408b29ebb555

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

