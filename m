Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218895;
	b=ISvj5zNaU7wh9ubCOinv8irb8APInC2IOyvSNBe6bN+G8fP/NyUthokE4ZU38dKLvacF
	 Se5fOHRjf8qc0zNc9+AwRALfNLBemNNTzCkDSiJJXUXZM3da/jtvFXtaxWEJhHc6vh+gA
	 OGmx/rCMFZfYgAwo8JLdoA5HX1LVQoHdrZq6TR0EUCgsNnD8NgEaFMwn8K8gZgVZJXp+s
	 rcf9RwDsMhMjONCziS50aFHjwIOA5BepSOaYbWd92kci98vpZkabyPBrQiarPDoJnyies
	 nzade/vgq4x+yUYEdvm8MQAAJKVxxgtvfHrcsc3NXUihjDbW7fU6x7YoreobYtUoNmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
	b=Qd6D+k1Mp7z4ccqXMGlyB35JhG7bcStjwvSBagMZLV8ByOJ+OoQFlMXQ01cI3f8fBlko
	 EIhuFRY8ngcROfnXAukgvH57d8yaifbZjvvHVJf9/1GP5dufXCeKU0yfl4M+g6KrxAg2M
	 V1GoubvfXh7hdxCND/P2kLrHcCEBtfh/umVhgwHcO1xGIyYQPZfpo102z2BHKp9y/h2MC
	 /+A9N2tY9lLrdMDVFQGKwUlFoTdpXKCGkdYqZu9sc83nHg+Vs7x6d+yTx85nnf/Rxejc2
	 vnMK4qPbnhJNS/ACpb7jUAeRO4b6YA4y42YaF6O2ah7U55Bg0s74s4tkFADqrdL7lYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppeEQm7r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOFpGDUv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA0606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 10:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1EA0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppeEQm7r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOFpGDUv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99us1x550770
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 10:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=; b=ppeEQm7rR7p7BPUY
	Kci1Awb2YtMG6qsDnCfqu96oRFwOLHYtJLPkvgpzGGfzZEUlTV57uHLKpJZuDuoN
	nuziQeeLPEGNJUcu5wVZ7Ak9UPkqcFjg+4wpgLM1iB5N27yVBhsuTgxs2nAohKvl
	7vuMoeQ+4Rl4YJ7VCSWIYenx5vzTcLsNTzhFbsalA872sgdGVqbq4QAFeXwAjWkD
	Y59JLLtaOH3YT8vfM7pNHK11/2dwmskRorfkisn15MO/TEFfS8V4vRVIubQh48aq
	M64iHku2DIagIPfFSqPTQKytP77EUo4iw/d9r9ntQaaSpbd64FGifcgJw2KrT7Ml
	BV7B2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2n98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 10:08:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so811381a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218892; x=1794823692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=UOFpGDUvy6cPE1TUgWFxNv1dgGzhPR7qaQOqjpxM+GKhNpk0UiGAdotQuNOeutuZVO
         SCIex4bbm9vJ0aCutZnNnceGPjWyZRy2zRsB2b2GglRAZDSAW5WOtyfktWFAckJ6BCFd
         Yn9goGaUwE/dJ4sBsP9BM+HKk5s4XCq/kG9DrwIpDoozZ+uJEKUD3ZYu8EHI/fsIdRnk
         gWGoNvwP7WEiWSD+1+nqjQP1nOt0qrhJF0rpEERr7TD5CGV6Ryo1Fwosumq3qYiavDQM
         /MZI6ykGRr1FTnhk/xQ3woADa+ihyhyciMEzSFTEN5S9KM4nCev2GdBCKJ6BOOH0hraA
         TNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218892; x=1794823692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=oIr1xNYoV48P16nJ+Hr1vhvluM9FR1FMbtsyPJjH6gi4IlpORxGR/oei+qgn3TtDbr
         01YOnGFC8CXnK+JUczt2wFeiQq0IaaLG6K0GzstDNRjFlXDHf0JrsduKbOeYwxOs82Gf
         nmkCDiAhZIIGdc7Bhetwq2A0HN7l0x2uI5YkfwG/VubU7hsb2mqrmrLx4CLmG4fSVjvu
         7QDpzxE0ATqimp/DWBvPSDGVx7UXQbmhwopz8nO6R85Gg8ocoGb+tq3I79sPfukKoAJm
         DVFL6DM/NXo4W7xzY5OlNjNzPqo0R+9amJUuRnJ6rLvXrUr1GbHcuvMIH+DN95e5FJPf
         qc/A==
X-Forwarded-Encrypted: i=1; AL+hErE+ZZIj/4WmBbXxZVFbrk5XW76Yr3GutekKthFy3O3hqZVkmRxvuQNfwAqSB+MzLSlmJAJefNXa6T/1QcFz@vger.kernel.org
X-Gm-Message-State: APuU4Z9w9hFhUt4g8MEqeOsRsehuquo/LB8rA4SGRW/EO3fDKTY1c0Um
	Hse11gkDf+r4TcxGf1FVsEX8/4h9Kn65RSyaKXUsmrz7gzvPbEohCudQBerdBGGPgUDLeOPoI1N
	6DqOaNAkZ5vqBfiFbeDsPuMq6uaVYgCGGxjdRY4rj7Q+ljYHlJt4MrkWrkMyDipkN0a0Bz5PK5Z
	Z8lHo=
X-Gm-Gg: AYBFou3p5gT2ZRnAs8ApPynjOxpb6EUaLYCcDpEl/LRB2DabzhRycvFtYzQhuCBLmDh
	wZhupfH+Hs5hbXVEidgsvXP8WaSQieea206IS6SHmyLNXB2+YxzOte1BQBD/UzIWG7MsjqYuyRf
	m5DrxncWbczbaPJCNKtdYPzgd++umWfWqMzTS8uwP+Trpvxp+QXWZ3CupD9HAWdzaAsIH+cvuTG
	d2+c6jRhZbFezBDyx20oPYycXJcs5NDGIqjHpFVeT/N4106hNKJW3zJHzr+/on6LMRw2qht9b40
	DYYbRGnGMBkKN1xFqlZYlJuCQzGI/ThYyYif1qZm1UeAsuH6sYzAnNYdDFIPAisHB2rrw/HMjfp
	gh/Xyn2BopZ4iqiFpHxXkSlX6GmZr8hxAbeFDoqJZsY7hFWMJIXBogxMHu3LzvPwcCB1zcvtcVe
	ep0qsELJPBDkJeVgCF0tCHHcOU/DXL
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185576a91.11.1794218892336;
        Mon, 09 Nov 2026 02:08:12 -0800 (PST)
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185541a91.11.1794218891857;
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:39 +0800
Subject: [PATCH v5 7/7] arm64: dts: qcom: nord: Add MPAM MSC nodes for the
 L2 caches
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-7-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218820; l=3176;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ZaVhC2MFnbu/kTiLZ4O2AmrSppiPduQJFEif++uRdyk=;
 b=u/FERFaskIqPAl5lMELjNtPiriNj3T5fZ59uO++4QSA9Qs5HQiSwNeAUgh2JrMcmT6/6c/Rgg
 YM83twlxNzsAGhVgsRFiHTCDFOBHKzfQ5hgK+cLg1j86Sd6luy6L9KF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX15pEibRMcGwm
 IoI/9it3OsNFu5/jab7+tLsDYDyGJsISqElyoD5g/YtP9UXpgQaRFXf527WVkbevOmDl7YaIsgF
 FMObzPqcuAU7tbz9RVZCEbQWJipHdnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX3sbFQnblW7j4
 73TImrBF+t2vl0eA7yKyf6Qpx3cWKLpSOmrGrUVFr3nqYNX5DBUaronTQrrjDoKwPkhNifr8Stw
 jADh1fCosPiog5k6TRk8SwRbo3ZMYxktvySCN+etv9x2WbjRC1Qdf9vA5ObEHwk67w6ZEMeTTxy
 REMJvJCHxko1BbFnZKdqk6qgZXRFFAz9ricq93Ye+AFnunLmDECPTp+dtqx3i5z4ytZPJQ+CyWE
 K5GeFFu+eJpkNlx6R3QSyPbXWrLNxYgM5CcLgJ/4HaqFYOBpRWMtC9o472K58o3oFvSYnFdEB5m
 iRvqXjyyKYoxHAIufuMlAR/MnIBOBwtKyjUkO77/cFBlKkYTgvOBJzuNhqPFJgdOvk4wGWgsZfU
 zOIm60bvDN5WSiX5Neksdh8NhfKhIk0ecOK1PA8MycsbYYn2BnrKwNUowo1OPtQiAoTY4iv/Aj+
 8kHb+fkxeBHUs6v4Zqg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af19b8d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SOWVPGG40zWAznzFnVgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: kjP9SDUvOz2U0yeTnkq2Va6Qvc-pomMN
X-Proofpoint-ORIG-GUID: kjP9SDUvOz2U0yeTnkq2Va6Qvc-pomMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node rather than
under their CPU nodes, to allow the MSC register region to be mapped:
CPU nodes do not provide an MMIO address space, so an MSC nested under
a CPU-parented cache node cannot be mapped.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 72 ++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350dd..285c6a3e5cb7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -23,12 +23,6 @@ cpu0: cpu@0 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -95,12 +89,6 @@ cpu6: cpu@10000 {
 			enable-method = "psci";
 			next-level-cache = <&l2_10000>;
 			#cooling-cells = <2>;
-
-			l2_10000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -167,12 +155,6 @@ cpu12: cpu@20000 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_20000>;
 			#cooling-cells = <2>;
-
-			l2_20000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu13: cpu@20100 {
@@ -907,6 +889,60 @@ dump_mem: mem-dump-region {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
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
+		};
+	};
+
+	l2_10000: cache@1a870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
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
+		};
+	};
+
+	l2_20000: cache@1b870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1b870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1b870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.34.1

