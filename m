Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092369;
	b=jTizMNmDChscZayGIZNi7dpt3iHWpUBFD8gMqbQW7fE/5w8pJoJjHAYViFUZsGu1KbVH
	 8CtFhlHmiVlg8vjYF1KAmDvl0u9PsE371ogMLYcJuhLsButidqIiEr2iknu9RJWxLs3X7
	 4NdRXgVba04C+bfiyLVv6ltx1hoZBWKIV6k8LBt2kM7B4sUxVTKxi4goEXk0+dVC/zVLD
	 6ksGEs31mYcVC2LJ1oKXvp3GWb1wx/a0562/OOrSo5pj3rtEdpsx8qiSpO2llfTUQCkTe
	 GDFVDPdRhZJ3BbHj0EE0WuxcH5v/nJ/1YBuzjezcrpJRSUarNKDP+NX1h6Pq4PkLphg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
	b=tMZoXB8kXt+WWMEgXubirT5wIuDgxRMt5nIhpal0mZnGeYGYIQFmvDSEqE8t3egrVofO
	 x8ve8zRGFWv90GZuUY3N+1iVY4SEiWNzQZIytpFSL0P04PpAvZTmFjX5PQ1qgRkLRtbGY
	 WtS1v23TNCBSk9DcXL0FQpCw053aoMvx1IRcJWVjrpSuLRcM1f6xMNiDwq+V6tWq7WtJ9
	 phxKBZHY1NTX9cNHnHd0RG8u+VOzCpy6oIFwB7Ipc7ajDNwfmEEgOCoNbRgMvQHWN9AUA
	 zoubzj6isCE57sdONmU+cvpkC2+NxHwUcTF+MxwpJ0PsAt4cBrQ9JzEK2+R+M0lkTmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIXjKAUk;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15AF606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIXjKAUk
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso396613c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092367; x=1795697167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=EIXjKAUkoMLRsnfT7WizJMG0mA+Wf5/X3cgJHxZ+ZlrZcxurpiPY9qaBEXdjWbl6cl
         76dDqZArq6bITIt5kIWc+gi5VSpWv+khBf3rF+wY5sWAh/Bqb5aFX78HIPp8QsZEpRAM
         wUqUJ7QG8oHLJLbu4Xu5tUzi0gI9dFOEfOAYl7sidkYc/qTLLaTbmv4Cvi1zmtgnajb8
         vyhFExZwwiSOfTApDrqkzyQIt0MxUx0TSNr/yOH0/OdQ1CoraEtLoHpUNQwEO9gZXyvV
         KP3fwOSpfAkukc7oA/VNSUeuXK9Kn4BUdGVjN5j4eh/tPrG9QuPHsV10oakcZNd7+Jmb
         1dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092367; x=1795697167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=noQX+r2+IMhDOXtf+L9SrzIIMxRTe+momWRHKJgyhynqn4/fjQtvPeWzlw33ESsFRQ
         HHlNAkIdKKqCIQzQzfyc62Q5Zn1ANyvPN0vL2azwOw+0joandDOzYfS7OG8FGACj3TxT
         it0S/d5++yGVsOhzszEy1xxKazXw3g97h5p43L58+Fm1pBJpVcYBgYdTRg/m0nMt/P3Q
         S1zyKfAGQvdigl5PL5PXr7oWvMxcoLSeyilNhpZcX5ga1TE5iamvV8AOU3wlrUeUyNpD
         vLRbJobJpb0+IPcH3dU1YkdbJu3CT9H2Lz3t0MLf5k4GzQuCPiG5WMBXV4hMxEdftWWc
         bUJQ==
X-Forwarded-Encrypted: i=1; AL+hErF4pO1XJr6ciF6ngtc8xuKBJnzO5kc6ccPKklIqSeUe6AoVpZIQOQNLnU6vtALOwJ2IzaEymYuLET4by9j9@vger.kernel.org
X-Gm-Message-State: APuU4Z/LyxUdZdmzRJcYAoTpofly1THLxpgVkpMQsJN1O/rSHYtWY0fa
	Hk5dOHavJTgJ8+oQAnqtnRuz+FVcMrf+UT5fY7bp21/5GFDCE5b0m2mY
X-Gm-Gg: AYBFou0Hw8cFsIGQ+DWP0iMqZ5us5DGqi0C+x/H0CqI+vWSPG04YzrOCYwWvN0KHZt5
	YSA+f+4DajAsNOakw2Fie0Pw+BKOVnvGQjPYBYj0yk3jMpsySk6dxaCDozzikFJuVtEcLpEDWj1
	wTTXcBLlgCCJRjUMHpY8Ss9/WOKPqZcXvkXf2TrV8CmX/2mvD6wiGKrlGQlxHC8FWYJpxkzMPml
	RPT5p1E9gKBrExT9PvU0kBJfGvNwiyhyWtrgah1eZLggt4AlaUVOLflQQ6t0xTnKY2fvff2o3R2
	WiEPDy4eYuGPRIiJqVCEI3RBMoN8TNBogSoSwBfUGYN5I/sbGRuaOhNFHQhTr25VS60jWTXP7w5
	0XY4gZh222nj8q5nhadLouQyqmC3PZ5e28t8zeRMRqwLxFykWChi3OgzEeEL6UKYsL+qz0Rhc39
	NkhSRJL97C4nlqJWT2au0a46uHmAepw5XHG14Tn/YPEaQslTi/eA4MA80EjX2oiqV0MJPsDtv7a
	uuh+4MzfxaHCG3+0C1CcZkYvFDvLfiLoEeTOWmpALsKhc4MTREXdmpe6TARj2emOn2hmaQUkkhb
	5x7JOFPQyU6221zfzKeUPQncQyruzbQB9eA=
X-Received: by 2002:a05:701b:2810:b0:159:f192:5290 with SMTP id a92af1059eb24-1b5524b591cmr769675c88.13.1795092367360;
        Thu, 19 Nov 2026 04:46:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm22350329c88.9.2026.11.19.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 19 Nov 2026 21:45:57 +0900
Message-ID: <20261119124558.1548-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261119124558.1548-1-26rote@gmail.com>
References: <20261119124558.1548-1-26rote@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs to know
the Type-C mode. It does not route any signals itself.

The Type-C class passes the mode only to graph nodes that have the
"mode-switch" property, so allow it on the controller node through
usb-switch.yaml. Orientation and retimer switching do not apply to the
controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v4:
- Add Reviewed-by from Krzysztof
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64..fdc2bc8d3 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,10 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  orientation-switch: false
+
+  retimer-switch: false
+
   wakeup-source: true
 
 required:
@@ -170,6 +174,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.53.0

