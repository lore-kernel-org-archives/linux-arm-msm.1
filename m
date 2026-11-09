Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184160;
	b=3s5egZWr/rdqrUGgTL0FUKzvGEduwRaXa1/pdVRtd+YEN/dERl0SwDn7qY9GYRyHRyzP
	 qyERqfzr5cKRUeZtNI9sQ6D5AM5VbJB0wHgwdR9OtTzF+LIGMmSu/9gC47rVLQll0I9es
	 R/ghHagjnPMVbVm+vXvx0D0hAVAv2TSqOpcmkhBkAV90zQZnE+s98mj+aUrz9vsq5CGVO
	 Ggn/Wr5wMYO6A6ciiX8opNDgr91YpHPhS4ZsDjkA5V7Laj5pNsSvXsGu4ck1c7+ZIf5Ia
	 yKlxO6QMcpmlfAEPoQ64S+Mhsf4+EKtDppwcDoVoiB0GqCdb+jxmXkOLlL66aN5l0jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
	b=4TzOXNXcRugQOhskeZqkRn+w8AgE3m3o7d1qOV8550DjvPpU87B2zaWOpD8vHh8QtNMH
	 /2L+3k7egJoLVDwQbawIc0Jw1wsLLAsTS0ie4I7caWPfW5XKx82HDD/NluFjNOjm6QGGL
	 AfUQ7CK9qJcUi/Z6gj/qGavPTVF0IsL5JxG6c8AU1c+Iy4mg2qZ1P5OoLKBclZGYlCmEw
	 l+3fsj9EKZtBsUd92z/FAjI2cPQ130H7GMMLDMOf+NxVeRnwjgnopPwAYU3v60Lbcq5r9
	 /rh7jMWgDucYgKgkY7FVqLkxS0p1GMGgTD8wLlPx6cs9ay3hylEGztIvC2nsLXTGWlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B2606A33B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5B2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so3176275e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184158; x=1794788958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=nr+rvJPK3LgSefZHQcMuNoy5ys5xeLDvzoC9dL9bjp8RsH4nbUvtSXjE99yObhKnrI
         KVL569qwb1cNWqejwxbmHvDHlCCM9a0KALsd+kBI6FvzO7MIFWyCNFlZuDEIbHakXCkO
         zfIMQfOZFaAE3OJ8FnLCKYM7zUrDs21JikhpKZqp8aXIXjfaoZTJGEDD7K6S/o4SX5ax
         oowccfChKBzSGvGYv+RX3eVnKnndMe0cVvbZC/RuWGeZ2dWFUr7H18zUaqz5ZW33sdsS
         wL85GB4wROuyI9HV41fK5wDrYkNmeiq3h3ee4AveMIdzJFeUnF6yICT2l2yCcUrEu8vb
         jQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184158; x=1794788958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=kywysbZs6MGGfXThpOo2ko6LGWR6J31idtThz3vNDDdlbhxo5rc+PcEwmjmOTcOURh
         29wiR7rCA+M+MjrPvKl38VQZV1rZ/1XqDUJOs3X4so/W9N3KKKpSnchJI1nwvATKchMW
         p2qi1CcTDZLXSpHIQMwN1C51Y2shz5PWiedNZL/mrCyMTkyr5+4MrBIOuChVzbeLxIfB
         VKEPqLhAYikST2JQ6zhIFreeg4PjkTS0ds06N5LC4odd7cgjURHxGYonNzmFWjHDy6cc
         ieFFunFAWkPVD06xpRakthUVpM3eOvVEMjlwLVahMBbxD5jlK6z7urlFnDudAujJL/T3
         Glmg==
X-Forwarded-Encrypted: i=1; AL+hErG6sXMScC0TERT9xPqw/xP5B9sNMZBLdirinEKH8ggsRVm1tejL8+LNBxYu7zeq2S6NTqO3uN8RC0e229T0@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ryz0MeUGhHm3PaZez6Pfu4mibeWWm2xpiBbPfHXXKjimHHtOY
	oOa7jlrbUxJH8sDpKe+rhYRwUD0sGIOkcLWvK6AqoF3pW9XebC1fBhUp
X-Gm-Gg: AYBFou29kxg/U387XloRwJT6tNh1df7bk+Y3Z4ylVKYaQ5chK2usO8QVwsRy+tSmy8O
	T+NKTVCDyI91gnhKtl0UGNV2bkFOV1M73AMIwW7B1ulH9n1A8XOQDHIzoy0rsfudGdmTVXhLOGX
	1HAl566/xW8tM/E5Py6VjUuLVj8XXQ3Jxw4JGRoo7sC2ZLAQnTjaYfiIDIMYCNkLYIDl+k2tvtz
	P0c28YljqDDuLIBfbGWof8Zs4qzivu3iwtHcj3CTinVScFneXUPO6+I05WbdsOpSjeIje5FeRB9
	5K6mIBt/4mRiHwJACcUTnVltCnm74wUVOtOfzr8lKH0jUGIr/sgc7Z3PTuqDQKbz05oway25CiA
	NgoctHNczTuDKuRlczmmEzisNVoNQHm9UFWjH8vsPiIwgtnKlsFtu5DsUZwmQn3LXKCePGmeOfX
	9j0lMNgrZvhIWGuvHUYwwfQx8RnwECVvvUglsrEgW63TVJqpOT5R1PAJSJFYffsShozLTHrgDYT
	9zOJgAkPREGxYhNuERttRzygNMcPhZrTL04e0T112x9sF74gdCeAxPBGWN+msVp/ogp0hqLm0sI
	i6ZxuoYS/7wB1PN9fBpyVWhGvEKgL1B5KbOZIFYg
X-Received: by 2002:a05:600c:3e0a:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4b94d762f58mr49204685e9.3.1794184158186;
        Sun, 08 Nov 2026 16:29:18 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:10 +0000
Subject: [PATCH 1/5] dt-bindings: clock: qcom: document the Halliday RPMh
 Clock Controller
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
Message-Id: <20261109-halliday-clk-v1-1-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=820;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ra2CqCyJU+PQw7aYPTd3iwXLS2r2IgX39NQHfJ7L+7w=;
 b=2nnGBX79rTyj90QOmojpA8vtdMSBp8gr0IrLIj+ozjNak9ZQIQyO+HH7+ULR7mGoGIXokPJ88
 iUIUnzmfx4CBKWS7MIXWXCNck7cizjy6ph3FLkNDcHhSietAdpSWg45
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa..72223566da1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - qcom,eliza-rpmh-clk
           - qcom,glymur-rpmh-clk
+          - qcom,halliday-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk

-- 
2.55.0

