Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD703E3156
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223576; cv=none; b=kPsfkv/eMs+SDxalIh4FSk0anQEXlzjEdKq2VWjnTLi1MUlbDIB2j8vyyQuMewOE8zlS3cQKIk2lljSlLs5ir31TpX94teNclWaBnTVzvylZnVAbX/ECd6AIJnGz4ujaSQACgHDXTXKc8vEJSb3WxQKxVyXR3F/mVsUw6jqQX1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223576; c=relaxed/simple;
	bh=Ay5gY5zuT57kQEmeACflTdBVR+MccGNrdp1Uyl/qI3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKSEH7LKZXz/e9Ec843rrQ8MrBNzovjAjHSXW0E7O7f8MoeDeHusjMf7LNGm9WQprMOe62Ep7GTUxr8GAdXsGW9MttpQAis/fmyW2UD7783UnuFO/cGIfs6P9PqPUOYfvgIgF1MIA4DvBB8RpidvuXhq7KDUEYd6XPJxdgmlqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9A7ShKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjDhqf9r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9A7ShKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjDhqf9r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S7Jh9a1973309
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfqdXNczmYB/nHt74rJ4NHMC9w5JYT0kkzYMUBJPysg=; b=o9A7ShKZK8Kqx6jj
	aXjSAF8qiq7kX6A1COtVpmPQtQ8CXJ7yorugMB8i+FGmP90qyZg8D24Yi2OPqIZ2
	L6vsQGJzsyzyiRNhWoihGhH1Z3zmXBUx9/H02fCy21iznEix8boTJMQYEPv+Bw9M
	x78Vs3g/o68uknTuCakqkPbyHiTiHRfeD3V/Vp2ZPRm8FijBnvDWWNGItYSEFd4m
	pxX2Ju46/ryfT0KgZKwTK82+/4ghNx9k1dNPzNJGex31tAhLiqrDQAUrOXNFv9WR
	/82SGtRiI38lyDTnQ8c1V7dmJQwMjG5BE4TV8zYMJYnzf/A+loPy3lI2kgyPDqb1
	ot61ZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjg0sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso12331011cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223573; x=1785828373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfqdXNczmYB/nHt74rJ4NHMC9w5JYT0kkzYMUBJPysg=;
        b=TjDhqf9r6TdbA19mlMydUIEZ5+1SPkUNTysIW5r8wnKagHcJ5//FM+pq1bNPQ8TByj
         KHxnDlHtRGPS0QzXGP0hCYrOHPB2VWp+DgGq3m47RLpyF9LRi8na0wO+z2+FKkxJNJxr
         m3eQhScu8A6JYIZs6lVIKxKPnbIM2kTVSfvo7V/fUtvhuIuvLglxE2sSuoO1iNwjPbNq
         YOXYVpaERr+naZR26kswuQw9UVLfr8VhUmHpnVSEb4h7YEQxoWYm3kBjxzMRSnHK0Lvx
         fV5zdpsrAldgo1Ayxcq2rkakZq6cqH8KFve5825xUBh6NEfS7KcGTEnRffG7G+1Rf8Nq
         JxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223573; x=1785828373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfqdXNczmYB/nHt74rJ4NHMC9w5JYT0kkzYMUBJPysg=;
        b=KAt4gSgE7oBZuWQjuYDluH4qCoxVxSKolrMy0cxEM5ybq1wHZpjImAYjGdhKKiW8uV
         nziaxCrc2rLoy9vRvBpVFtBZAvgwD8eyRmbZ19TFzx7iMqQ1pl+ZP/u0DDx0PvmzDiVS
         mbFgaPzb/+2YF168vGpGkXlZMFWvQ9mYexiEu9Mtoqad5fmBwBlWVsrRXx0anYzr6D2g
         0oCantJTeb8jZRdU9hsR3kx1qCklZirQD1SNed5gltbk7j9nVIKPc3XBXhPKbNJwg1n1
         JzMw7UWyzx3yky57JG1riWO/TsRPHHwRJsEh1WVbCQurhaSuAgL43eEsy43Wd8R8T3P3
         aZYw==
X-Gm-Message-State: AOJu0YyYbZ4zhp+0dQs2D5AKPM+fam4+zbd4HOmyDEaUshpuXUlSW5Uw
	pipos7jL5ZqUWULrOihxL5tmczJl8UB5ITUZ6nPKCgpX5fPWvVSmb/18DLsxoAiXdwudQB8g/2S
	FynIvwyR3GzTPo7E4smKN0BVIL33KrU0UjNZJxRB+eC0qLZAOlDNl0SSFPQywfHbPZk32GjO8W6
	5a
X-Gm-Gg: AR+sD10yy2FV/YsCxQ3hzYqZUOYMpf7vssgSjcItd+ufM+RsBoVYkE2m5IM5Cdtm6Tb
	gyPOccrGBoTV3TYtsujxpAsg2Ml8J/aKlyF3AipOO/I4r22TomTJoN2HqQBadorRJ+3m2MXKH6c
	OI0Z9ox6h5bRefwl8MwpBWbsAt0IdrS0Tx4aMcA7hmEhYB0sVxtxpRxkNGZqCMVAyAuJvG/gNyq
	wicpTxSCH9+xY0TraPWZgSfTjBiUjWMzZbhQtTlK9wtULFk6inRDTA0AhzktlKo88yVkKCCCND/
	RTtKBDZib9a3BCmwg4CYaQWPdiTSoqoj0bJIDHa8hC5G/6GMW/eJjkMYXeVHW1wz4gXrbc63zUx
	hralGEdQuuCzgmo9QDBcQJ+cj
X-Received: by 2002:a05:622a:15c8:b0:51c:63d:fc10 with SMTP id d75a77b69052e-529d6fe1ed4mr9166931cf.25.1785223573049;
        Tue, 28 Jul 2026 00:26:13 -0700 (PDT)
X-Received: by 2002:a05:622a:15c8:b0:51c:63d:fc10 with SMTP id d75a77b69052e-529d6fe1ed4mr9166801cf.25.1785223572604;
        Tue, 28 Jul 2026 00:26:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:56 +0200
Subject: [PATCH v4 4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-4-39ff32071641@oss.qualcomm.com>
References: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
In-Reply-To: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ay5gY5zuT57kQEmeACflTdBVR+MccGNrdp1Uyl/qI3A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmJ2MCZZnPsREcD+u5HwD6h9m5QYu/JAc41c
 /RLCK4nLOiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZiQAKCRDBN2bmhouD
 1yMLD/9lC4M4SukfMDHRXdYxnemr74zYhOApleaQyxEm+BvX6DZOm4l0+eXPIQVmqi1qjmfCVZJ
 Vc6qRpSe8LaT/WX+qHTBJiZVpbvHO9Vfit1ZEoSY6K8T8yWrGmQdJ4ivZX7UWBtDQtaH0Kohj9g
 J/peLg5hmW+n2qUTtr5qI01T7NDAZQF7YoXgJ/G85BuGEs9hNElHn8iQG0f76BP+c4Zb+gJ3Git
 jfyY4DVBBsCBd7Z/vshdEM0ZZcypylJ7CDgrXKhVp79cUX5CtHERbzOl048YNDr8KWFqjRnKaDW
 2+Sw53yx+3nB4+NskEocfxfWf9vcSe7RNsZNqwnBrtS1Veolkxwb9FQDbzD1sS8iX4iCI69aYMn
 bJQ7WZnxJxN1YY/5B+XsY9MCM6QRdZw5lJ7S6RYTA+em0c6xIuru03ut+/OqfZ5y5pgE7TXDrnq
 vvU66rD6mDix7QWvs+U9Gw7+qA66bu9oTeVQuNNNmThby2vqlwP2+pyNQRpDGP6WXERvKBzxTZE
 7nXlb1s3orHLyQZjqNsmBeDt3O6RHiRcOrBAQCwwa2/ERhCdsoL8XiLFnJetkWYJMtwua8wvI7y
 BkDt+ltMcFYC/UHS3z4BgOVtDk/s0r7wooSqC+c3Xwz7osW9T67LCed62fHTb3MaDIe0QYue+lv
 y/9kynoU2Uq65wg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 6f4YXsKDbJ92exDO_8V5L5SMPgmmFeUP
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a685996 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QIb6LjCoyyNvk8-zv9wA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX+RLXPv53Y78M
 tMsQlz14OnTuP9zpw+3jNauwIgjLs2Hb8OqiVMv/AlCXE/+trhPqFgXb8+uu5bQflW2sCP3eMoT
 w2ujqP6kYqb5cZfWzgx3GBemGGS0CV8=
X-Proofpoint-ORIG-GUID: 6f4YXsKDbJ92exDO_8V5L5SMPgmmFeUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfXxqZgP9mEj5zw
 bltetHnA5/onac5gDBvzDa+8QcIUx4lm3AOjJ06lmV6xEWKtKk+ExxZ9B/PTzcU9x+Njkrhvgo/
 YtvxyDLP+GyC2DjhefPB6q/+xvzzGZiPDqGTWHoLcYU1xLSuI5LWMdrxzFf04PyUbk+7YdsQi+i
 G6D22XZmohXSMqBjRxA1lS+aMSS+fUMkqump7jV8T7LFpOLGIaUqhz01gPAvVyDtSyGVJCP8Iqq
 qP+2cTHPgc/m8DZA/L9Z4nfrE3ppHrNaN6iecnEQnvveWbtkpUMM226hfbyyIck1XUFewRE3Lz5
 di8NTRilh6MoxwJtkkJvpfTY/ylMpUXqO24XC93q2Jb8mUjHTQsrZFF35xsRwkpdHJo8w299NYp
 cD4k8wEC45tj0AzbcmVb/Hmi5N+VMdQRbzStxkD8KCSqKNJVghNuy08VoEdWwzJ8ZtIqN1LWL6O
 U5K2GVATZIDnRw80DdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280062

One of the "select:" in this schema captures "^qcom,.*sa[0-9]+.*$"
compatibles, because there are SAxxxx Qualcomm SoCs.  Unfortunately
there is also WSA8810 and WSA8855 I2C speakers, so they need listing
too.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
https://lore.kernel.org/all/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 04f0e628a349..ab9369f84fef 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -83,4 +83,8 @@ properties:
             - qcom,ipq806x-usb-phy-ss
             - qcom,ipq806x-usb-phy-hs
 
+        # In general non-SoC Qualcomm devices do not need to be listed here,
+        # however in a few cases they got selected by patterns in "select":
+        - pattern: "^qcom,wsa[0-9]+$"
+
 additionalProperties: true

-- 
2.53.0

