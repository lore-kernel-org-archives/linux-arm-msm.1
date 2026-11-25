Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596436;
	b=xtnM8kXoYg3GBnBWWcfEbf3zlI2O6T3ywI5ztlRBViz/U3xvXY8gUg931gT1TTYmzFBZ
	 WdLTWZftxjoUdzGHotWFnXAEf6HUReeQyAa1JaXnd4w2Ez3xliMbbziXnVYaOhcmUCmmM
	 KCePcXpE3skNTms0bDHOqICYhQYzfFDSu2m9BZOChgCCJUt+8Klpap/uSgvcFzkvnbUEn
	 CYdfyDFlz9atlInUXfdP6m+2aCykv18c/jyFhIwk9iJW4eqcb9WV7KUR0X3Oh8Ziw4sWb
	 rLCgBQ4aCopPLXRLu15NZpREW4opKN7RhXIXy0aruR8pRLmt4qrTRJTloE5ZX47yQ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9JczosLg+2tleGLZ5rgCSANI1AUwxWfmCJsgr8HB+Wc=;
	b=3/QZR7iSAsPSbjdAwW3CzzzjqF65StkfPnE5XRx72GvO313+UO5EAzVgj5Bx8bJ6VtUy
	 /6rcFMhkejcbETYF2gt/pIOqf8oAJjSavV9pyee2gIZb6sKWgWxy3aeP5EL1xe28beQ3p
	 qpk+l6Z1kP1tK42z69AFEXF2xjDLznasynQslnHoEP8e9gbfFprIb23qa36H04Aus4SU4
	 fBt+fIdYFOCU6QOYW+o6NDfcWQbE7Uf7QZsI/zWXviK6c2LNKeuBoHghZNlb2+9zgpfA0
	 aayQDEMgdU8o3Acf2Vne7Nnq67XvT7xJUwF6Ic2080SwOmuCndxDmn8XWmQYsqiL41w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0NlGyfj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD66606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD66606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0NlGyfj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so3603475e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596435; x=1796201235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JczosLg+2tleGLZ5rgCSANI1AUwxWfmCJsgr8HB+Wc=;
        b=K0NlGyfjGbdsgVftf6yhorm4vLUo1t9RKlAFZqCeGpWY95ifrSNlBMEvJt8g36o3zA
         mOSI+K5NZHGiZWPJI82G3yXKlGWnXFHUZsZO8KkXkOKPzsVAHH2KvvX/RKs+THnjzXIf
         xLj3aDZ88CsVZsaay+0xHYa64btplUhlmmnnjpcV8K4JfHlhCVgWlCbMIwLF7PDQB0N4
         FwGxsELcIVT0GAKexwXwroYw6u4NItk9jqDiAuKZvpFdMbsAezHIapq7KDvSJp4FCQYp
         mbkjkTtyVn41YtrPpToJR65tZUNW0Nfp18yN9rqjMq1NVZ5pjCg0ndrsaBmB4oH3hpAn
         AHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596435; x=1796201235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9JczosLg+2tleGLZ5rgCSANI1AUwxWfmCJsgr8HB+Wc=;
        b=B5I9j7d8FftJB+TNsM5caiTogfIj8EA/Dsu0EjMy0Bwz8j6IvJxkSe3O5l0IKbl1Wi
         bNwq/MiChTefnuDgIeQOWezmbxAY9V8e8f711IzzYcI3giAgJZ1fPfgEUiO2jT6gQx/S
         iCiBJDVgQDZYwF1JU/7fnc9hU/ED2nP5QXXy0sc36hEJeD4PklOvE+oOJljmaBGO3O4H
         Sw2t+F8IBPPzrJ9t3kHRmSd/4GykDZRSa9QmLdCJsKCy0OmZms5T8SqUt48cWavb9CIU
         9dCovx6raS68xN8E2KJxpV7AyaPd2R5d+4FEvphC6QAj3TZxO93SuNj1t7vd9p/nwdJc
         9omg==
X-Forwarded-Encrypted: i=1; AL+hErGmARoLd/4Hoh0HViaH7rgnke1XxJ5v45j62ZYDMevDb++82lOujqYlr9aekWfrRS/SAvc+7D3t8xi393TC@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zmh8fhQtSLPqrKRQks3+loepyCTBuakl0gLP3wxgpqr7fEM74
	esdbjxiyxmLDYj4RVrsHmfbOntxPiPP4qmPsMqVutw7efYN3jYIqV5U=
X-Gm-Gg: AZFdTZeYNtvxS3pXh4z6upK6mTWYyqdGtGq9woGtF3KZK4pyiEF0zjbufN5i7Vvb1/M
	gxYbN+MPfhT+O9BioAnfqZ+lLgJ7YV+y3Yy/+eiVoQ7tfx/920xusDAe6/O5av6FMj58fcYcgE/
	NOIJsjptKlWtyzTHtCQB6pS+2GLJx2Zxc3oUC3HlAqJ+6crubMNDFZxF1jPT2NkqdmILOI5DTTx
	eoQNyrm1mGiJuu/Xb9QpSvBgaBzvrGAzDNF/BXGuPJKE7apmGgf6usUWqukFKDlxOWQ71lovSO2
	Mg9sdS9KvrP1QSAR0pXB+4nc4KIYNeYLuG8jixBgfFI4l2TgjQ4GszxT/Dl8oiRSBteCqrMN3+z
	WVa1ChBc7pM0tnZiZY/7Bpew/eZp8CGPmwqSV0sBpEzXNsUFFjeLdMAGVnPeyEhL6YBTfnXH16/
	KWhvmgUA5dXCtZ4DkVGzKp9d6e4yMdMyx5fEakF9uigLctNdcMSrqRKoRZxIvA3xlFCL3Bt1R7l
	PNapY7e51fW4alEz/2pFHUbYL2DL79rMjnyzuU6qtPMa4Nh28zM3pcfMoTGLRS5GNnIn312jDQL
	7dWlXLEuu5MCqgvR0sc3+j//dDBIWufBRjDrcZqxiAdI+ICXJGONp+aTq5GPKluheh3J
X-Received: by 2002:a05:600c:6092:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb8892bb67mr320913895e9.19.1795596434483;
        Wed, 25 Nov 2026 00:47:14 -0800 (PST)
Received: from book4-arch.fritz.box ([77.39.161.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm465183985e9.4.2026.11.25.00.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:47:14 -0800 (PST)
From: Nicola Nicodemo <nicola084@gmail.com>
To: opensource@grische.xyz,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] thermal/drivers/qcom/tsens: Drop __init from the ->init callbacks
Date: Wed, 25 Nov 2026 09:46:11 +0100
Message-ID: <20261125084611.11437-1-nicola084@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261104145740.2623473-1-opensource@grische.xyz>
References: <20261104145740.2623473-1-opensource@grische.xyz>
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

On this boot path, 7.3 with CONFIG_QCOM_TSENS=m and qcom_tsens in the
initramfs, Samsung Galaxy Book4 Edge 14" (X1E80100, NP940XMA):

Without the series, the probe is deferred and the retry from
deferred_probe_work_func jumps into the module's freed .init.text,
on every boot:

  Unable to handle kernel execute from non-executable memory at virtual address ffffc2f2779b4150
  pc : 0xffffc2f2779b4150
  lr : tsens_probe+0x170/0x670 [qcom_tsens]
  Workqueue: events_unbound deferred_probe_work_func

With the series applied (same kernel config, same initramfs), it boots;
all four controllers probe and every thermal zone reads normally. The
compatible is qcom,x1e80100-tsens / qcom,tsens-v2, so this exercises
init_common() via ops_generic_v2, i.e. patch 1; patch 2's callbacks are
not used on this SoC.

Tested-by: Nicola Nicodemo <nicola084@gmail.com> # X1E80100, CONFIG_QCOM_TSENS=m
