Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188111;
	b=G8FLV6W0qRUm5YRMXZzJtpkg1e8LQ/H3cK7LndQbnW0PSd6M3P0190ynIlwdVt9CEL2t
	 V7/ZlOmyE2sv47X10iBsTrX4DccBmGBwLeU0O1hqs8+0gPR0uzI3ITEouVklc5v5sG/Xw
	 Hp1pyzqaSzQ9SIRlBkMcp6uaGts/BcdPG/7YUPOKJy33/8niiMOsFlu4W8Ig8+qVMM6gb
	 kMPYznyv6wO5RKUsSz8YnLWjGIyBdBlA1EcTTASL15RsBkiveGaX215Na0aYKFSP6oxJc
	 rr2md1Q0PyrxlmAnuHJCm7ExdpuoczbnxsVPV1YpzMC2LamMOQKuctnTfZURNzvKAPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
	b=yzqMYm3Mf/7D/knyzVRbd505ifRLC48/R1R5VcSzWn57+l8nXCa9eInBUToKwMX/xwUb
	 68GYV08Vq3Qw89HNCEo/+wShJM1pG21zPC6mZ8fF1cOXkpeVpoVGJA1nnBVPftXXLCh0r
	 giJeqiQVPrxybSSs7vSChw6xhvV5RTcnPBzcZLd7qlWWyM9two6kcRakWdKCya95KibW1
	 fuhn/3COCQUB+BTSyLMzg0fREtx5Gw+udiRwtjAONJPC5FofEymD21Ss04qSiLSmr5Ujs
	 DG/FpmZ7MaLyGG1TkU+Fw/aShDW8O3ery9LkjEk8j/Y8TLKG6ZWxyJQg/I/JQdWkZyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bn6P3afa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083C606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3083C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bn6P3afa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2Db4154753
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=; b=BPCNdJwD35hChuwT
	JQOnqjp4G0M2tcP2sveGVgO1bOK0Bi6WszVbz4yjet+bzzstrO+Ga2YJLSteeRj8
	zCm42pWeQz72IU8i+1ECjHGVVZNtf5PwqQyYDJtMfes91o39rKJijOyGDco56M5c
	ogvPLGrZdMsmdhqKBAHevYqq7Jk4f+rjk1ThiBEwpAPPnQcyoCUJGE7t7Afj6m/N
	D4R4C0yWpbs5VzefSQuBsgs2ggSgQKBi5cJctkqN/ZcdugzgaV6IUGLI8Ad61d9u
	x8JtSyATjx5267hYSLyKBKxmrERSXui9G+D2B3OU1FZ9jO3U/BOjx5raAkVnvOHh
	VSY5GQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0mqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so5866035ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188108; x=1793792908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=bn6P3afa4ok+thlXjBr+0YaDGdiX9PJmq8LlhwhqIG6MRazwHEdEs/BYAjZTO+xAY/
         fRTEFHmaBPiGW/6ANQDax8A/jGdgWJfHn2xzpa2LPJpBazpmltSnKUnq7qcMeklS7Z7F
         0HL/GghM4Ve5cWBDKdidj50e1dSwNKcC9OtukqWa2uQpaluOAmxu7qaEXRLnht7yZEP6
         rlGIg80aFdpa0SAsRJTIuWF1CSqOffRpUDPMnLwYUZrMLoZkI0zFWuZb//WtJm/4wOhJ
         fbY1/mzCWU21zAyQOWWZ3J0AFjeYxz/+lIHfJEmAW+zDwOvGC71KdHa/NlI0W9LPmIFa
         pSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188108; x=1793792908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=Muw3xFIEgx/KosVo3I/ey8CyfYFynnNkYYNvskN2gZ1hsGl8MkX5lmolWroNTJ5wtV
         BxfSZVeFftvWp6rBHPdUJxQ7DF/dnBoWW6E/WRNfzFO22WcGBKcbobUlsbPMqPkhGUP3
         FtHt8B8DPvfA1zYhYD1FZt41yX2Es1KhP4nZ/FgMZvWHFKuhLDsB30wDqU6k46BUGXwB
         LH8r5Q1bABu5jI35rY401ACIwiTeIcRzuQ6UiepOEoOconeRMeBnxq5UqNVGJFr/eYNk
         TvJsJbV3akmqgEfmrW3iqczubixHFP5+cDQ6XbQE7tLVMH/xaxaXJGmmUpDUSrt+FBfS
         lUcg==
X-Forwarded-Encrypted: i=1; AKwUvBw5wfj/FLdnUbF1E4aor5R5t5BOd1CSQgUhxyeskfqWOQn4o5Ykf7RTVqx/yzXLKeHFadClOrVA2sBu18er@vger.kernel.org
X-Gm-Message-State: AFq9FYKWsE7NryRsnfx18uiplc0O+EbFmNRl6CrkOR8XbkOBkxcEHE6U
	9SQ19ABrQdrac4c1/1KOUlsU5hj5IQvoz5cz44bEEU786dmVmXvNUI7AjGq1Ih5IlMUUqagZbFb
	YEs3VTN6rYeDsC1qWFxBX0JPv5PzAIHYLhogNOyua7xLuLdl0kGjPm1z6yPSzXnoKBIhR
X-Gm-Gg: AYBFou2uBcGLE+lu9B1V206fq9bJsqWkYC2DF2+hRziWI4rQfAGLRWSzL/jU5qFqzUI
	D0jr3OkB/mDgoSGhV7KAbDNnhH6QhummEPUMhiuQxw6WU19mbsTQp5y3lRhT+0IPFmKSskuhz7u
	UlWXIFLe0HGlw7snGeNirliAIzl1E3AWPp2HBqQhfhELqC/KwB6JQHHr1dPQAgv7AEmAayQZ+hk
	OIGxQLGrKJ90DLUbCkogiHcY7wZmVs7vhCN+CQw+oJVcu7xnO9g3ta2KiA4UIiBykPXf7dJ8QjV
	S+sjAgn39I4n0Lu6SMwax4qQU8Tyi+5jAleU4EITaGdqXymuctPrxheyoKEWfWvJuXOhVFl6U3E
	RrYirkskdn6jljY+u0s54PmHltaYx6zv7W7aTmIagLuCiGhLBITFfDb15IiDqxSv1sIqrFQ0p8+
	BDYzOPVphVkNGGC+121vfaF/Cn2pJX
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19433175ad.5.1793188108031;
        Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19432715ad.5.1793188107526;
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:46 +0800
Subject: [PATCH DNM v4 6/6] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188049; l=2980;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=EIpg2fIGRMBRydrB5ptmJ7TII/dpx+YM1XoZaljDCw4=;
 b=x/J3ue5uV1wMxc65LI2QTgcNRDwtcWB8n7h0nyP0eO1K1PUyDd6XfFsaaNBgUK2zJSIqu8/PW
 qhoFFd1vmHqBIA1YzSyn/HzTI0xkTspyTgNaiZf1+/H9UOE3fkw1nRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: mA_y7ePUFIyQonecWJ3g9QaHjcM7cbx7
X-Proofpoint-ORIG-GUID: mA_y7ePUFIyQonecWJ3g9QaHjcM7cbx7
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1e10d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX7bv/HLVLIdjd
 DWtCiqaOYnULszkc18xSntxYGCFbnGJ4Ds1EeYHPiwt1b8d8KmQGFf0YMNu62q6nfYPEmn+lSnj
 VIf1eD+unvcUGcQsHOT9hNx0lUtD8dYgNakLtz7s1ZPDBBsolOxsa7nz6tUw+AuWHwm/SLmP0R+
 PFeVUwsw3V4sWPj5tQN8Fo9jW9t23krMO4lLcD2w7dcHAs0YF/TyHFO6lCiJ7f/MSb7IrFgYWPh
 U5QXqN0/QlbjzQuPmdmxa/+vl5PYXaEY5qpAeq1ZdoQMQdV4O7mfStvbcD6my0HJulYMJv3arnG
 CgFGNYi2WP0RKqrVyHxn2uv08Qej5OPQi4dQZ42uo6uF1sn2YWYPxv0Qjguj7wHSBfAm+sXY5N+
 ccvHGDULpr3gdIm4pGFl8BNW//KYG3MybUfnW69td4uMQR/dhWTmepEgKqm3koZsRGcY6/xarIC
 N+4MqYZ0PGHBPGls9+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXzwyL2646/oPA
 3SqNDnXjFsK60afJiKe58/SR0xr1LZOzbgmTua9KTfyqHHjwhmVb6eacZtei2Jay+Y0uGmRi8+m
 BHU5uEZZvZhwvN/vBuh13FM8ZZyEtVo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280046

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node, using
'ranges' to map the MSC's register region to the physical address space.
The MSC register size is 0x2000: the Kaanapali platform implements the
MPAM registers up to offset 0x1FFF as permitted by the MPAM
specification when MPAMCFG_MBW_PBM is not implemented.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..10aee29a1ba8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -49,12 +49,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -121,12 +115,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -532,6 +520,46 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x19870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x19870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: cache@1a870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1a870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1a870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

