Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981783;
	b=pE3uo9XocVYyQbxME8SB/MR6hUJub0JjTewJ+JRqgggT2KTCq1X02/9WSldJnifMsbuu
	 1tAnmm7nCocI86wzkFFDDqRryn7eb92Jg7kudb+DpJQamuZeZHcUvpMzVQl7lsZp70zxK
	 CU3CGKYuFU/zk2+1Dragdm8xeSsQu+Hk85BZbi5wM5nLDZGropJT8HwTuBiarKR3cx9W9
	 xVwCuPmpCdWh0feMxLYNBT7v5wV9UjA+I+kpOyX7RjoCFTggyaD83+ICYAeL/RgI6kRqW
	 F8O4ew3MP7lDdamGlLbmLuC96KlTEor4DAREcditJuLFS+NfxOtbzUar95w9xR3nrDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
	b=JDtyA+VGjtrPd9TTogu+AS7pZD4BQZUmh39lmMN1fS7sBYdrKxi6Sj/kV7iltAixm4aq
	 OLDQfItmnJHUx0BDZBzR6dLbB9F4WNPjP+ln/9NiAyCRPjL4b1uceRAq6gLNByNuqG2Ug
	 dFYB7lREZkV5uNajnTGGp6oFdxTSM0N6JZpB0Cb6+hfL8Dj3RwJe+d0NqNb0Y1xQQJlUI
	 BCckjZi59V1dG6RV9AGj3PGRUVsPyxmUMuYVB33Mm6fu0ckCJ4bjOLsyccOnF7P2CXCqh
	 1ZDuEaletSsNsHc8EkHLsIAD0L8er215aUf+2MNp9XM1Zkkm6vM1lQTyOBl8O/5psXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1C606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uw78472554
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=; b=KtnQKBgrryNKBV+K
	X14+Jy8gx3M3wi0BzySspud7Y7foqX/OEzl1X/cQccu+jSSLNyiwPc3lut2qiH79
	UuCf5pp6ZQ2FpMbZtMYGOIYxHzbAbY3g8AXIgQ4kOpeH2INHnwMgnabjw/KOv0Ph
	JrILVHRbu8D9R9c0dmrksBf9lASahSU3ShW9EtDAq2GI0nzvteKfSYSDg0/A0/VX
	u0f1d51bFgyIb+3ANe0rF9ax+WkUSJ45LZ0YISqX7aZoDDAmQvgQbGVS0AddcQv5
	+zKWf0QcSN8OpUXar9hJMHap2Rr7aRB9P09cSkEI1O4toDuDr2buWovgkrQzyOUp
	G6F3ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89ecn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso469997a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981780; x=1795586580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=cqSaMUA9uL5CmhqrYBxt7AAQIG9rNzJ9MjcR7IwtnhnA3iZ1WUKruQVu+gQNJqoioK
         drmMwCGq6j0+bCt9OYb80NNi/6SGfUPsDP2fFgWh1dejluep9CoMhqspLtbEtdpYw0kF
         l3Q12u3fDmUqsZ7W4ar0tY1rihMyDzdcvX8+ez4lsgDBYpjxJSNrIyVcbzbEI5xyobUL
         2bmIDt06gudh+HCKne0QgJymDIo+QJ/LkyITJDnIUAx1Tbnfx1/APQJquTgYUKZd+YR3
         lnt2V6+o5oIN1qhi0jdUNBHnW8dQ0wdP6HE4e4Cp3EoFvvZN6ldx1thKDDVNSu2KUq0p
         nC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981780; x=1795586580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=HALD0L5i0r9iW3ypYJSJ13Xv6vZVyLTjv8QvZyjen0k8s5IuOmSiKR4AjZ0HK+Hzru
         F3gmyQxTs+h77rJ/aIwLKxnfXgljRCp2lvhAh+oLj+n0CZDHFN2UUBbXZGFVlfv3YCQ2
         ZeIcpjHAWVEDmwpK/IdWD4IdqzdL+nXRnnJINYC8c9bhhywRQqRQ9+slol47q/rqSWz2
         Nnf90MKdVgfZSvGxyPzydFhHfW4gOD34h+xH1hQwjW3u1GT/2pdgDqhRsy9i56x3ib+v
         h+3PL8djPXFRfi+cG/shKdkOW1Nhqmk7pNTmfTuIOhYl82Ji1xbWErG5rvdE8DIbURro
         DzXw==
X-Forwarded-Encrypted: i=1; AL+hErFqTA0z09wLv6RhhbDRRXJmRJl8O6BF3v2dd4Sx5/gWFnzZR+JCY7EFl0/LY8zkuwJwTmn+o7eanMbi7mG9@vger.kernel.org
X-Gm-Message-State: APuU4Z9+ULl7MfGkBn+1tuXAIijeFl6gTZlXpE4ypgoX1hNaBNiMK7jy
	6jm4GEKBpGL8Gpje84a/oeCmmZlG2tgF8POAIwcIz1Pp71pyt124xsQQ2/zWj4AFLx3dkbdWuht
	LQz18Ie2tvVMAjnFUgFsKOxLMHTjFFsi79TLr3eISExr/7j3ZZZO1IXwh8sx+zL7payPN
X-Gm-Gg: AZFdTZdBrNsuxCaT8HwLb91FYqQ1cLWfLUkO1bp/Lj18J2iqMg+ZwGfrnfvxiiBGNu9
	HNQMPx8YxHhQ/obrUDW7KqhTzu60B04GUVs8JlqcXE0dxM651K5+Bj8pxPaSn3nKL7Lu/zTdtNn
	5Bqt/HEwFV3cKE3pwtbVRLPUhgpZGvWfYXcE1GjfnqcnNqmMt8OpsEhtCmIbEd9UUPQjPRUcQZs
	uQkwDX+l66a/rLF3dzC4ZifNYgJH8T9Fso3G0lN8TcCBuxa+/NanSd9SeW2jfwVnlFZgs1g3ktK
	VQghdeGfJpHyjyXEGEUgIS4zP8gb6m47a1BzB+rbl8ooiH4ipuJcupw6ycTNz/cJIif1v5ycSux
	MP7OmhBEWsoxjfW50h/aN0qZDb+cE0JukiVOWeckwRFF0VK4EXQ46zm0MIuxFbme30uwbU1j9zQ
	==
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780695ad.39.1794981780127;
        Tue, 17 Nov 2026 22:03:00 -0800 (PST)
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780565ad.39.1794981779689;
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:34 +0530
Subject: [PATCH 03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-3-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 67sXBd-mJyN4Wx3GpnDotBadjal33qSB
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd3f95 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zDgi9xSYwh7u5fUgZvAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXwAnHmS5Tktsi
 4JNiAbaJnlL05MYGPxem/i+rO85FVu0fCRkIQhJ/yqw0BuH4/NDAkM28fI8ai0mds4a0jCbzDiK
 7Otz5WH6UggaTDe2h+q6DL6l2kxT1UjBdzHqwnnwlGT3mfLCnzCYMQw/9GNbXbXlw5YjZ3BsiFv
 Cw3csp7aIz+FoRsMdxw6bIRaBKwAXkOKUtuizs+ur2upW66AaAt1RvWSZLAIUikLcG9j6Wm7U6z
 OhhXrJ7Bbw33U5T7SY8EvQ5dR1KihJzbL/1TT5zn8OuS3qWPJ6hG/NvPvR/nJSwuNsrdF+1fksW
 9Enq+/gZVPjSlcBHb3NKHxekZ+yEFSGaaBYGi1X1J9DM1crk2cjHBULYX8vLH94zb+5eD8CAsFe
 mmGbBdlVGkSH6yNTEWKM69tWUHTkZdSeKZItxjSWcObdZ/IvTeqwI5UdQNnF2oB3ufT00Bz2jde
 o4qRtlpHnOc3zqzKelA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXx5lvOVe7Xl3e
 h+ukEZFFswlEfFxjdpqhy2iS+3fCqnqzCyM70ixmrxleo1VsiK+4BwO8YM0A2AwJOvoo/8Rpc4U
 eD9H2TB910fEM2+40JlFvFNjoOBmlfw=
X-Proofpoint-GUID: 67sXBd-mJyN4Wx3GpnDotBadjal33qSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SA8775P TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index 7a156b9bfaf32909125efc89e27f8dc671909964..1100ddab52290093af87250e4181043e924497a5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -83,7 +83,8 @@ $defs:
                 emac0_mdc, emac0_mdio, emac0_ptp_aux, emac0_ptp_pps, emac1_mcg0,
                 emac1_mcg1, emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio,
                 emac1_ptp_aux, emac1_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c,
+                gcc_gp4, gcc_gp5, gp_mn, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s,
+                ibi_i3c,
                 jitter_bist, mdp0_vsync0, mdp0_vsync1, mdp0_vsync2, mdp0_vsync3,
                 mdp0_vsync4, mdp0_vsync5, mdp0_vsync6, mdp0_vsync7, mdp0_vsync8,
                 mdp1_vsync0, mdp1_vsync1, mdp1_vsync2, mdp1_vsync3, mdp1_vsync4,

-- 
2.34.1

