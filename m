Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22553839A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848820; cv=none; b=nJBKL3q4mw8IvBt2yH8IYfnZZ8bhdgWn5lWCMvSnbl0wioVZABrTVzHUlK4Lny6dZmXHPsEjJT3tabp6/U75kpxo+6oSmA9Tfr2XMU64z8dhbvbRUpaJRYpAGOBZqyCLUUV7+hs4mSajna7tjgZZbs/MIa93Dw4labVK8loEPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848820; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NN1jn5Gh5jopPonCJF5UtBJebdGsPQ5jeSndiSkyHy1vNWLtVo3Ji0i3AaLXfsqz5oealwdunreoMCM2OFmKqezgtuHy5C9JpEVY8WdbFmhKRldg61wH4bY5EjqRz8v1mPBW6jApEf8qTiAg90KbzWVweenqrzFyJNAkTXOpFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8vvVj2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1RnM+Ai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8vvVj2v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1RnM+Ai"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbhv91310855
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=N8vvVj2vTDZzGwDP
	A67C1JtkqcTDE53xyqIRB/SYAAMWMy+LHtcy8zSAN8PY7N29uUmX0BftGy8MdN7K
	EGsCSXD3ROSR9NFgNiMmJST28GA3MV6h01b6mlJQw69l6zmbhNWZz86bHrgrTARb
	Za2Twxone3gG/EmKGplJ9HTEkfLX45P99ffP93JTuHFnRYTGSNojLt4T7c/l8YQS
	2O7SWRYpBFVuVK41L0YtPBDlGLIfXXebfV2bu3KUHCdu5e8Tt9Guwc4to6sq9ULF
	WvWlXfLLed1KZ3r7anRbhygqYvy1GXjHtI0O1Dfr/IpkdFhP8EaQ3SH0THqqz+0x
	AocL7A==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5kt2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:40:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e9fe8b17so127325a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848817; x=1788453617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=R1RnM+AiFb1vvAYrTfvpkLn1oDos1NnS03rpGFkK8D6r+aZ9uMxVgki4YbHA5D3osi
         OawSqXBptHGVAom1hzf1EHIYW9C1jQpezWHU15BhXdwVN99g86fmnRX517qcF2lOJ91q
         9pbF5S5sGAu4UhwYASO73myal+/mPanDXcW68HBdTGZ0BSLVYeJ35XykT0UgxQGZhaUp
         BRvdHDnvV+eAJGBtQ0eggZHKie1U9yCuxf3kNyRSbZ4d1xufQ3leuKiaOeHhG8Azb5mX
         Kq8SDRWt66cJAyF3ArRb8F3gbxCpqF2j3yc3WSzuL5e2RweHzOUvSOhHsT8Ye8w/jwwa
         9zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848817; x=1788453617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=EB3TFKg+Q9AkGoqKrq6H3Dlh7ER8M84CEomCryQPt+QC6j2G1AkRqkVfKi2nE0a72y
         m6nL10/d17OhQfSKYoBTqV7lfUjvLMpA8fJ9O2Obj6SKkJ/RtolG+ILSymvvsAFb2onq
         FML6Z3dNT5/miMGMWTl+6xr6elA//4z3tQ9BQw0KKpHBSn/4Lc4CgjAYmPRbyRIORPvQ
         BU2VVuHCxUmMVI1/zBz4IbxPgYvlYskuLoneeXKXuzhoik4DLO5whbJNZLG9ELSOCns0
         nVC5afdky1izVvZ6AelY/ri0V2Dadxcm+KlflW9gkusc+xqdNzpTjCtEWl9gUI8S06pM
         be5g==
X-Gm-Message-State: AFuF++l3OzjDXndGXx0au9KLFHnq+TMzxau9G3AIobirLKdlxEui7EAl
	9O+6He6ADXCV6hbreRSLF9XJ6Y9zWidK2EHqFv3PzeQCxWxfpAKLcmy7qJ5RnmzNjLz5i72Ny2o
	oWEqvi+1s24A4syUN9ROKuGvEwdPBIfyxrUoeQSasB6MyFNIrTxX1hPgn0yKVaCNxe3GZ
X-Gm-Gg: AR+sD11Pw9VkEHw9uLTnMM+UoZIaRUylH2b41NslpTFlV9ptM4QJZItQiRI8qcfF2tK
	vstGzIaEv64frLakDr3RVF/hhfEmxQxDqbp3LUH0ma3Tqe1V/s3X1ReRB8AffV09zqEu2T/PD9F
	oxUYi5ouYxLwOoA9N0fitzkhwB8EfUG1Z21sfNpRvUwP+wN+p6DoD2EnBsdprnEJjOtSiSVDFOu
	nxRWTJVA+LRAkdvnCIZfW7BTWMp5BGVfscaruELE2RE1xPGw0KzPDu4lWjm2RISUUuVMzhn1MuW
	j3T62Jw88fq1JyRfMmpjXsdP222LDs5+ZFrE5HQUEpAHWnrfob3F7XqmBLOeKYYKf7VIQR/k/Bs
	nVpY+27FQRxPylC0HRc/40wRk7gyII/sR/iOEGScFouuibvNNfsWC7tH/754iJ4yVX17lXiqB/L
	aLmNxNw09DEmX5mF49RsVhYSQ=
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261518eaf.33.1787848817469;
        Thu, 27 Aug 2026 09:40:17 -0700 (PDT)
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261458eaf.33.1787848816972;
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:14 +0530
Subject: [PATCH v4 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-13-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=FzE4Q+PBujlIxnBIqlmOr7wAj0IwjS7m5ptJ/dDcSO/NJAOnDGcge2UvSXP9Ldwdg4J2npUQM
 agBO9OVl2R7Cj2H8FreXT0fPbuMGanegKflD/GG71Sg7ZNDymSJR3cG
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: hs2DBiE_Kq4DA6ImVUAlBm9YEbKjBXXJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXzJjtl8dcvdfs
 4vpcsim+m6cw6Xdkw5oUXgWkxR6rk+EXOGlJ/DlKIEKweCoFGh5jD7z6wQs1u2aQD7ituVBeNT0
 uYUfWi3pf/PU0Jg2JHp+rkhp7AaawNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX4e0wuBr8ZPhd
 jxYOlXLyfHXxu9klFh8nmqlUjWJctTyX1pou5CCwrBZ/Es4eu0octNcI8zqVOSgBTiyIjXwseT2
 pVit+J1XTzpo4qmjD+XV12u2B8yYR9KjLILyrTrzpF0BWZ4y9NylXZNPBYhz9odes5s+D/+cDS4
 PJ9Z3s11qAOAcUns8mgjWkS25PdCTRDgUwESTOs3ifxfiNREcVB7rc4IzM7O/yBzCijyEXxBlIz
 hBJ6enzSYXwEV9/YMdPShPfdJA5fIQy+/L0dcX+UJ51ZHRPoTpddUFax8GCV42nsr3Dog6NSdv5
 6bkIMc5D7W33JDc2Kev7JOUA4kk3qHlm9zW4cnhTjSc/i/KouDx2FB5nHj5gDL7pr6vtoLXCY8T
 IzeqmcKHdTbfaQMvr9QgCtqvbbbLz7qXzqeNo7XXH/M/N0xeJvdKRM5yEKSbFoBeQQGxrlM1efx
 0zf9ddbgI6YBoYswBaQ==
X-Proofpoint-GUID: hs2DBiE_Kq4DA6ImVUAlBm9YEbKjBXXJ
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a906872 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

