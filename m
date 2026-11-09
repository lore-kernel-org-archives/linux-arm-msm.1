Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184432;
	b=WHRr5mH49Eu0+/+DxRvNRGlpCiFXzogiN3WSIbSyvvZ+9rShzugwScyWdIW5+8LY3US1
	 wGLV+9pPNgfQCJaUZp96/37KSCj2KVwqPypZcpR1RFgGPin85WKGUJCRf6UvSsppw/JJz
	 Vrlbf1O/UBARfuCbWqmS46Ddhsw75fiRx0PbCbpJig1WGnPuH5v5WJ/ObJSnnUd5ggyGy
	 iZ8S1Xuw7rm5ebY+MtM9xd1CTv+388wCCqUtqWI9LabixSkZ2bUOvRk9aynohndwpVmDC
	 tyaGMAiD+nhlqK3BENsm6Y5OnyU/eEzez+HJLMSH376xOPhj5fmU/nzLf2K2q6M6x5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=ApgVNEJIYlLdzSX3EhjwU8TXT6YvjN63W5gi5Q85Vke7++yHlWmdREvUKGV29XvFuW2v
	 RUsgEDoPRQBzgYNHmvoWFLgIhcdVWbihDptsz3XXwGCEOJ/hrtPQ0tgSq5eafxsSOCIHz
	 L6pZCwHdmud0iE3XxU38mBTO/SE8FQ+6mg9jdiwfQ9FZBhBcRkre3rq1FO9PRWCwFz5kx
	 dgHJDKixARa4hlkh/bxWZwJY439FX2WZNMJAuf267fNrrLDn3LIP6OCzYxLDYB4QFFP54
	 dTE3/pHJ5eczb9nGXatam0lRiJLWxZAYkho83vZPORvy/YcoFDWLfc3AWf+Ny55aSog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9319C606EE9D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9319C606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2793115e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184430; x=1794789230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=mqATGSDgOcyspCGm0r88zz2LKvOBuTSrflTy4G3x+OmZ3/e6m92wx8lwDFbkWU/2r7
         wF4RvcborS48J1HQFsH7E7pQgiQNwsPdfK59/AT1PhF1G8mvFKr+CfuUUZqZjulYaEup
         ouJz/e8/k/DLsRowKga8BFqAZDnPgMt29Cmqfeh1kSkF5wRiiYm0/AlufG1QlkuycLwj
         rEpBeHEkXJziqZintgY94/c64b0LNVR31luc5/F2R95zuMihuSOw0tSRvV08J2itGF5Q
         e6yNkFjWR7cidQVwBnB5dheZp9Tw2HuJb8BECeTsjwwMmrbGM5Ib9dRsZdyiCb151RhX
         5M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184430; x=1794789230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=gVntGyxSIYX9sVFW+oHiX+r4YHDh33+K372ZCjYM6c5iWEGse63gW5Ys7fVhXOz4dt
         pBwCRDImx0aCtRP8Iws5IgNb3aNXJzsVeYX+LyF9cFhbOoW2HZ7pWiy6EyVg+9kw0mbr
         gUhMkqAlG+UA1pq4yPanjvSmu7k+R0qEqAReEP0LVsok5myKI+29/g33xVXBBWq3ZSyw
         VB5QcdCrflk6WEpAeggCopU5UiaaoYiqCYWgwB5PRJ4IJ7VZeekh2FXbAtAFELTs6lKM
         nMjHP7RK2iUcw6Tp+ZUGx4Fs0kREpZH3Rp69FAIxH0uVEPsB9yMhBrVQk7N/q0xtqZmJ
         EqMw==
X-Gm-Message-State: APuU4Z+P/xaVgTDKqN9Bw5q5Q8jgkNbysDyimFaWZnwdYAjY0TKIVwl+
	YeKWNIEY7LV3RfBoGeB5eZDAOVua8r4t+/hdRb3G9AR4ORGdh5Zh+fx8
X-Gm-Gg: AYBFou1tX0ERJQ8sE3mb/g+omc4+9SmcRojos63HHqgBaUvcXTLfaXxm6W7C9CD6GqN
	OuM+sxXbPa4zLPPLze366TjtOhzt7gnTGU/yLVjgKgg2q0N1GsDsqVGeB2XirkvnG8M6TnXqhTC
	yqMPCjc8PsuBGsm+9NpILude7qZkOJRXDQEhoFUMG4/wmlqjDWzKXT1msJx+/zBrd9ibNDg4M9e
	IL+0kJtzwfCx2nlSE2FmQEP7Fcj7+blliDQng7FAcQwGGLzEQ7VSOnFFg6KGQjeimfKYz512fbb
	beX6sI4AjMQu2KOVPwPeSWkCuBk0u/pMCFYkh0vehoRdrp9cRWX4RSlAtj4yrWHbEM2VEowz7GQ
	11+X4hkWmH3Z5/5NJGsrlDVG6JBeJP24CNyNlMbWUWIi6QKnAx8QRyyzvWBqfcHOMdDxwWslFiw
	gQqxGLYPYARr2qKbhyQNlQ8FL1y5Vb/sQ5XVONtSESbBVodGrFPTXy1Kf/6LWh1TajtQkp0Ti8f
	qglSgyZeBDUb6wrj+2H1+34fSfB80c54Q+1mCbXaLIf3ufDDIy91fraHpUc06HEJkFntIM9OLp1
	2n6GEvACdh1rkPUVMS8UQpNG8WQClgNPKIu89H+5
X-Received: by 2002:a7b:c34c:0:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4b8205a7b74mr74612065e9.18.1794184430004;
        Sun, 08 Nov 2026 16:33:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:17 +0000
Subject: [PATCH 05/17] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
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
Message-Id: <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=uUjeKsqz31kCcfPZSa8Z47M4B7r1CADYAoSad8joeZDRvAbLwLDkhf9ZDymLvxVoerAVE+UqI
 g/farVtv7C7AYkuFx6U6v9lz+2+4yx0RS/OmA8jjU0ljraJ4I1qJLhy
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

