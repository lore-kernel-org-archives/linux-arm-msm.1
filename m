Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981856;
	b=WgswDQR31490TX6z53/sLYkhMBdBaJHQG0XofPXjReeDBfCUoaXGS1jqadpVaYIoU+ev
	 lxUn/ZRQpECG/F8sSs05xtq9YSdU5DzfNzGedS1ZZJWLbI8LveMCAMlLPguYoksYIRcRw
	 6RK8aQVnIUS5w3TZS7GO3JqTmniY5StqYQ9Wg5FkxcEZ9M5VLiyACpqsBLbON2MDoGo9S
	 grTQW0yQR28bX0oBVIkaheWz+Kbqw+Y09noZ0B9IYM0+utQLEJdfC8YjEmMTm9pq08njr
	 RFkaoexj0XpnCPrPwDi5GseyZ5Ce/RhbkfWvUfCmjoJkls42Jy0BsAyrQ02BNbqJhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981856;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
	b=cyjPcDHbjL6H027LaQr3GG6Hw7DrDIkxHjHhqjEZTq3bFERAbXhakT/RGz/Ctk0ve1TZ
	 oSNgOOzrbUsDiEgoIeaDRuU60kYwKvCNO2x/cyqmYGDKE2/C1xS6WWJHOhr4k658Slk+F
	 C6qwbr1Oxxv/jZOPayLVIO0dqk9gTjFq9XHW5GRWdrUhJ0gFDeJjttHv4c8WvR4lISCyo
	 nwfknO7WKfp8US+YlYPEvtf1vUxxpWu//jnSjfyxYtFCqSFirQEVZFE/mPpIyRHZL5U7u
	 amnIL9HGlJ2FDNVN/fmTKJBUMgCF/EMzCPj93jOKCtRpl4F/Vash1OcGV0sd2cILg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF3606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BF3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uuei2453530
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=; b=aIBxJlhBUfMCdaV6
	jD8F9K0/I+x6B19Hzu4zrUUf7D9lennCZygcKOdXpbPaqYe4SdJsJtgURwwevFQL
	kAvVDvFZKFEtZFZ5tp472eDejH0FE1J+oDew8yfZihjGmtZj4o1SUKvXDd9NPm6K
	d5KtqrLsZcNAqg4yorxsagrzndxBKybpSiw83F2stPUR90/pwLvxBTCKkcSoY0s0
	rJR3B6yMTHgi9MG9wJ0Eu0eX984DW0mx15+T0FNJY1qDhH1mD/iXcMaMoN95uwcT
	ig5kkY6zAlMbTNwsY1DsnrWN1qchn5n6YF8DUMZdenfO7lxuDhHNnBuvunGLp8dh
	4y6zMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99euc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb5375cd68so6484575ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981854; x=1795586654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=WJADAJ6oMzy0/U9oV6a5LodDvgwvaykgFSTFK9y85pZovcLAScxNihkrIOP6m6Mc/j
         obZZyY60bfJY7Ulb1Hge2IuGY7Pv8WpIOR4CmjPj3BollB3yxZHDuWsLCKoUYRfuxHjf
         4CisZ+dK3/QvWea/hbH6BK5M6TE8QJv/vxzW57fGi17ragUuCS/cUEP2i7UZgfDOuhy5
         bjqUE/bVgaeIchk8R+Q1IIFYMTlr6DStyyxpE9XBx2mfnVaCYg8p6WODU233lgbXkbZ/
         yEjGN1IpXA1O5dIbwt1nhhSKWukNtBX3MGhOvDHxFASGUHIik2uSAwhLSu8n76h0dkTR
         x8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981854; x=1795586654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=2XSyJkKY9NweG958Q0zacnYhhQTw1vvF6TGOmXM1JSj4QjrXv4oIavXWuwPOjI6CPq
         ddAW6aSgxHLGbT75ngbP92FBq1P3OB8gVEHClV6f3u9Ndo5t6IvtBtoliSA6ARjjHD0F
         zg9PJb+GiaX25WxFx+6ahWrJCaD83xywaqGGlRXNm7z3g7WFJES+kzt9cEbOzg1S6fZL
         FJYt9aCw3ZtUoUoTxY+iZC9JgZ5dUlSfloC4A7FPC5ABW+NDvlKtHj8MUAoOrEaY3Ju/
         pKntY0MuQcG8D2+rXvDIVur3jUXlybA4Ei0hB1ZcSm2vAWecOH5Sq+qzpVa3NWYnzNch
         2hKw==
X-Forwarded-Encrypted: i=1; AL+hErFwyanjQJ52Z+k6je1P6u3J+iGOZ9TyeMJBRNk+zUgmeKhU2Ip1uMY7LeKC6tYrV+/3Gnvv1K0xnrNRXLKK@vger.kernel.org
X-Gm-Message-State: APuU4Z9w3Su5UeokJoPOyov0dpey+0o9kkP3//lsSZrD7sJiLmVAk+ql
	S5cIJhBNDcUyB78OxHl4W4148f63FKb2kZOPxs7RNoxIHmfdsB29cX8gnXe5vgPSqkpH2NUEDg2
	D1302h/DbTe5UItr97D/2FKlouOEhWEeAUqmO2INuKiaOtOOOa6gFgc64ungz8euNwdAC
X-Gm-Gg: AZFdTZcACMMMAtOMNfud+3Cj02eRDtPQ0OVMjTdfioikX8xTIzlQAKX57lXzCgvv9kU
	cUsfLUApWiBLq8s927HWC5ioD7sGXD+lYcWD0gyHMVvm0chiJrZv3qaLtEP8mfkjYU6/mU/9bcm
	vLwUS/xPb+hV7Z0ESCv21mz834FcCxRFn8lDAoTx1KADozAVC219XE4n7GttcF20PT6D0WKY0YJ
	XwxZ0EZVWGxJJphozppRHAQ0qrb0tfMy3N/pklS/dj5VGt4r6z8NlHR/UViJLVTDfgcnEOOa2xU
	Q7NngFb3D/1TjE/PVDI+cjVK7AGoFiSH0D/RGCidJPelnLICkb5lWxbQVsiPvix294Y49/G3lAn
	JPqjePPw0+47Gcpg0ndO7MhejtPOdIyBB3wX5T+CE+PS8yLQEiayiSNGf/kZUsI4bAHkgZD3Bng
	==
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933525ad.63.1794981854161;
        Tue, 17 Nov 2026 22:04:14 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933295ad.63.1794981853715;
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:46 +0530
Subject: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX52/LSV0qvr0l
 cA8zzxgQbHyEF2KKmnEtikunLIWKBFFQcHhdSod36Rj+RibtzASPqlRI87AwOo3xf2fRQ3Ld1oY
 Z/AEpTTYAMk+c8eh3ecT2tKVfNS6cC8=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd3fdf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UWeVNdHasT3lCgRpUHEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX8+5tcIFNPkwB
 i2n05doYcahBiq8fpNjo+iPh5PMGEv6IQ9SuJWaac/AdjIg+7Hhqkm+DvUlg/qBXPEyoE3sL+wi
 8Ck5FWd7qSbrNkwSsKJooextnv4XWdzQXntMTaPfSPXN5up6IT6pMGWxKrpQqWj/B7agLp39VWE
 8oCAET0RZDW4SARLWgh9CunG2/B1+TGAAZ2O7pSEwbMosCVOGycCSN4DhQFp0PhNn5xLcmprGcP
 ii8rrW+o8NgRIxx7tzYZzh4vPB6X+40cY+sfIotUNW8x10ybTePPjkDjAx6Lx+U70II9C3jiKGh
 KX4pGl9Mnb+I+DBvN8Gv6LUtmT5YYYthXm0dNDz1KmgMXIme/6P12Zp86LJDVfj7m7Pn1dHS9Ar
 r/311FGumUyP9NpLXolKiAnp2LjWHnr8NPTSntJz4Mar/A8CiYZJnNzWXc+AVTmT6Acb2gaISd5
 cPC7eS2F/AIsmbQ9GpQ==
X-Proofpoint-ORIG-GUID: Us4GHK8UaqtNbg88i3qpRqD1DOEkpAF5
X-Proofpoint-GUID: Us4GHK8UaqtNbg88i3qpRqD1DOEkpAF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Shikra TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio87.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
index 411c402f9044faf36c5a2250795a817fe43dc48d..420d0b5eab1821bc81a74cdbe83a5de480f9ff3e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
@@ -73,7 +73,7 @@ $defs:
                 cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
                 dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
                 emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
-                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
+                emac1_ptp_pps, ext_mclk, gcc_gp, gp_mn, gsm0_tx, i2s0, i2s1,
                 i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
                 mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
                 nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,

-- 
2.34.1

