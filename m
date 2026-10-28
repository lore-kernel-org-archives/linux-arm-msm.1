Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188077;
	b=x9bG/jpGTJYs7/zMNe0ATXwvLH4FcLS9F+a2BayAQ8tFOgWkn4ko5PICEqQT3YROmyA5
	 4/SSgdlfsvLZ+8AdGMwr0sgFRKWcJSNA3WFKYIf/qjjXt+qoPw4H/K8/kYRujht4fTnJ+
	 Q6371fj7+QuwVxeLE+ymsfrH4PtE1I+NnatpfBtbNTQtlw1Y0UzngPXf18FMgH8joH0mg
	 q8qzV+9Nr2OH6+a3eBd3Qe/YA6znQRp3icdKr3bmz+artwOPKR689QZxBJGYR+3BT1rrR
	 EzAZbV0Ox82hAxE8rqH81GOdwnCzfGN/wduI/sb9rKP+hfwa+YL68oW3GAlidKLPqdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
	b=OQTlFveOe0bI4I18MkGnyeN7D3k5YbbDX5z2Ya6ypgGUR7O491ta1dYEVhlZBICaKjYd
	 nwv4OR1v0GYNg/qOr4RpRdCiEUqD32hUze04m0e3RFxwQtvv+LDEOfx7JjttvmNZDyut1
	 gb22UQwZIL5LL503lKdTmV4RFHOFYd7NRBCOQZ+J1Uu7w/ZDY0JovaR5XS/5p+Ct3uHeg
	 ZpHQepQuFS2qc/en/JxSrl/YZRdlKfqEm5jYSgC48o7hYp0gXgsxr7ONdDyVhBnCaxUvZ
	 0AEa8OpkytQcQniJTWkbG6UvqgmjCk3es0fFDIW5kwB8omCfr/5oUJmQinm3mXpXJdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7yWPNL5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UGyCaqoH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79A4606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7yWPNL5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UGyCaqoH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAvQ3704308
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=; b=c7yWPNL5Vbl5HhwF
	Y9kLuiFzcg/+wthv122esAhjKD4S/YIOR/5NgwWKmWr3JcrQM0Ajx/yo1okU+mvr
	LhXx9Hr5Xu/eYhRyYOm9JDbrICGFnjsu6jF35KlFgWiYOm7ZDxC7n9jlwfsKWKb0
	DZnB0aTzTPURelKiYnZy/Y2iDio+ri0oZIttxcNZJCpJkMyABcmVn0cY6iT8ywqM
	AZbCr6XVBiuw8HWmKyYGX7KzcFvvfG9D9PsPK+mRGlFl70AnUxQybsLT6E+swIZo
	WQ8iKdHh8U7Qmoiei8i5l1raass2Hi1CB+T3zWQ+Q94YC/0CXhSZCQ3cSa5uIwKX
	AVl3eg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7140g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:47:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e80f7acc67so10318805ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188075; x=1793792875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=UGyCaqoH2h1dDcvtC+POxcwcxZnx0lg1bwOgPCwx2ElTUtCYEXBYcWiIe5rVzJoKnM
         SjtLySJWMylkT/A1ZtQ0QerO0Lk2p718PK4Y/3ETtiBFzFqwgBzhm/imbThnShmokjAN
         q4FAcwNASCdJ07C6hM6qsa3y8WLYhDiQTGVy9LK+9b/qDUm5cNNlBEZZB06JXG8ELQd/
         owOFPIZctv631ea9YH304Si5BR+u7gEJW6XnELfTd7YrlIWYskVSymB7ozuRXOWgFNw2
         c9nNwmbli9NY8eDqdh59oC4whvPrupxH+x+qIgE00TeovfHl2VsuHuvkYgyKrXXg8Iir
         V4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188075; x=1793792875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=hfSNz8HFN5C7CnX7sAp8SyTxox6WQ/qFfs0h0HSo8Gyc9XUI2adahImMoBbLi+k3gA
         DoqR3/aI+YcscnAZRJKlxRU1U7FJjmBAw3qZ/F0ffhGxcGqU8nAQxqNln6QxgQSkakvc
         2sMUIyLeP4eEJx4V18PjkBKbxYBVy1E/hHtm0/evjYLnfRmAhfUn5Sgq/f/PmGGIcHOn
         RoN6x/C6q8+yTaEO4TU3KiIKVHtE2GAWEXxW3EAYx5w3NsJGC/vXX0ESCUf150FQFtXz
         Wu0B+1AaO20QqUJSlyn0XzieSNP+LTrA61/4liVmvlAUUMTYDP8e+lSJPFuv5U7FLJGZ
         3q1g==
X-Forwarded-Encrypted: i=1; AKwUvBzkenq4zGV8y5cCYvfAauv5we6qVTUW8uCBK1ISOqfUS1NNUTHxPuq4nhFNYShsXBbhGQZ1KC5WN/VtgKXv@vger.kernel.org
X-Gm-Message-State: AFq9FYJapXFXfASseWx4mMQa3vQ9E9me1GYURNKOPVTFNv7F5BL65kBc
	+sx5NragkRaFiRCEnfxnWfzMvQbOVNgyZQhhlZ5vy6uyc0HBuHGvgzXAdYxJ7HkI02CLj1lsBnU
	H+QIt//j/ktvzyuuVYLH96+PN5jDhNz9jBklsnBXSXXMx2qccyuhNDMx4DiFA1BZQQnKx
X-Gm-Gg: AYBFou3vGLSDZ23pWjQ4zJQjMgVso5zBq+/ro5bWWCD3nB5raFNafgM69OjtDO5pZeQ
	toQNXp2mOG+A6g5ZAZiEsCqSkfmi+nbjyYYqrAM0GTM6kn6O2TxTYilSXB1r8X5+GRXuDheMHWf
	RndHmZbbj4qWyBsL6mhr0WydCrtV6vkTbLJlf+qJNwZdHXcHobWHT6slIvKog5MeWb2cNf78gJB
	MWJ80yN1TZAoz7bnID2Om/d0XDNFmvIS4Nvuy9mgGTb5HUTUJmcZcTEKgaL9/rfLZQ2DI85I5V/
	fYJ8jMPp/GNwhOYxrV63D2iWgZDSC5FnSFN3GUtuX75LCgd85YyyvFmkWjPj4fsbu2TKUey1z7V
	kyY6LYK4OGKEuDUDjxfFBsP/+p/EMl1imatVyXcq1ZdkUsRsVJqceO0Ovimr+ggo78+Rn8rnBUg
	K5mZDSQo+v814bi2aYFSevbuZFVgcD
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577575ad.1.1793188075438;
        Wed, 28 Oct 2026 04:47:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577315ad.1.1793188074861;
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:42 +0800
Subject: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188045; l=1777;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=nnENsS345tQgPHx3zmQ+K+zRXVP3ubluTbm6JNHyQSg=;
 b=h2ds47c2oQRKF1vNQUB/QrBIE9LXmZDGjjWF1lGMsTu3cB1/hg297KQ6IRBkgJXKaeVT7jVaw
 5SRqG1WLBWVCC5cujL3fHmxMtZq0KcEeT34zoARvsZTVwcieLZR8ydF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX/TAFAxwjzz5P
 iWD4ROGyk084V4XXwC+gEP2017d2C0SnWirsCMeaqT3pX1igJ2zzFSt1dUnfeQpF5uKO2M8A8y7
 sl++x/vG4TXFiVQ7cQ8d0tx2rAqxaK0futtBiVFEzWJPzIP/Y7HV6p4dHO1iWpp7n9t5FBHRRZW
 dkTPCDFukLkaK09uCXOgM8MyMcNMNJ+mY9dSvdMfhm3kN6iU2zvLvGlgDNEEj8PsK/7U1NpPdms
 fNkEU2rqbLitoWOXIPLewo7LwAYWehXAzhok/qIOVjsKyrprRt2CNxX2QWUXdofbb7lAITAaJFI
 mhiWKBbyiUgRQsgixILeYNilHcwKyNVS8nvJwJ1dAaiJhDZBjMxtkWFY1uPpXuiikqr+dsmylC8
 E1+UgEUnc2BzTlJipQlZrlmXmBShPFtJPmEszxhUezdLt9w6Hx3iMY0ApX/8liONvMHXIadxv/x
 ly4ojOemCKq8oLiNk6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX6X0Qq8Gzbsn0
 UxqZ8jLiMZWHFhmpI3JsP9d4gtK3Z/eGoTgo8B3eL+juLLycu7mwwoVbYc4lgn3teusRdM0XyOg
 p72HBv9XYcYT0cI578uUi7GT51+cqzM=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1e0ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 90nleSNzGyyDdTrQ79-_S__C0fmUBHJP
X-Proofpoint-ORIG-GUID: 90nleSNzGyyDdTrQ79-_S__C0fmUBHJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 347a5a6d6a1d..0f984fcbcae9 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else if (msc->iface == MPAM_IFACE_PCC) {
 		u32 mpam_fb_msc_id;

-- 
2.34.1

