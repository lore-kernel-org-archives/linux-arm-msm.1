Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463875;
	b=I5aO13FbE2HY5+PRyDF47w9JXsdRlJpdbiXM8WrO/a4jp0kj28Ol04JBfFdPpxVhQvOM
	 l9c05C/VYJSQHapRQHBWzj4o/4Op3VXgWSq5bBho4yWlL04zNiLD9YvVDFO0D9/m3oj2r
	 p5ngGWucRUfgdBDIvYFBKMuCRTCZt5JMgldfqUu7oNpnKmQdSgbjkMc3DJgTySL4scn2O
	 h0e24Wt6ZSpXidQR3buNOiU6yQsPHC/wT+L8FtJilyt2uz27QnyBi0snejlt9Y24ZYBFo
	 SYTpLGgTMXwsGR00jjhyGr32cK+zqzllau2Yo5FvGsFMPRQ3sIeI/a6rspybsW223hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
	b=SK9k5H88NY9IP8/5w+FFu4PD0jUsdfqZh6r54Opla5w3Ro5OX0nYETXjPLHP0kQ9Gqkh
	 n9M0Hq5oc6DWmVamOi9NEbTzbz7K6WRFMgG3CtEfUppIXZxM2XJLfujlC7DWWx66vanKK
	 TfIZ/Q3zMaokKKqiNXJResbDwrW410OEwkmX9EodYkAhvqmZw3eJumjdcBWEN5o7ZKXQ9
	 XdSmRTvhk8qSZstha18qLhsl8H08cQN2ZgQUveSExLni2XtdG//PTRAk4fk8iijT/NiC7
	 KI4HJyr8wnkYsMymDzJFzS5VZ5iZJm42AtlsOIRVzb/oCBEDR4HKI9oVCBIKGZXva4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOSMD9fU;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42217606A325
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42217606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOSMD9fU
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5363316fa0cso21844721cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463874; x=1794068674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
        b=NOSMD9fUaSlnnAVs7rDQzs+EGkLJpl98bLE6Mp6L+MVutT9zwJaazzQNB8EAK1qifs
         bBwwM3+WLfOICY3Is7k8e9GZ9J8ydKWjTqNqv3dfYyGA6d6MhYwNsR4IwfftTsOoXr7N
         yOdhx6IWTWxDVZ6lhsoPzzq9bRhXCsPl8T+iLhNsvHxBSzSoDa5r77nD0JplJm5EaH5e
         WTG75zqArnuzvweE9XoFWOtZfUV5VHxjNTixWsaMVJZzWz/6eXhsSy37tnxN/8os+LU6
         G1ac/Van4gaAK0eTWbF/qqg/SfXcLSCHQnCzEVuy6B+TGr5AA4A+JQV6l2BowGrmlYYO
         2lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463874; x=1794068674;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
        b=nG3C5K6TdvGxDrciofKAseFDGVeUfuRZn/y1tYPqtsao9JK1qcyWK5XXTO8a0PuGLi
         mgd0i2bQfxduC3NmSbGgl1ukDA4nPYAkRY/EDd8FJQhvaGR/lMM+o5MLST6qNKu5qUc2
         Qy/PDTqtHfy8Br1K25JcZgkgZKefoOQG0To4yVsj2DNILW2YEu58ChoeWXavFm8q4iFm
         zKIXeigk3uNU3Ya2N4zR7guB0VwVZFqGrNTTR1ICciO7Figye97awdrUT+PgakrGt6VA
         Kj+j1ktCN1ICbvUBxUKchipVmSWv5tYUDamBWTmI6oniUNOTujdgAxdwrsXPywwU0edV
         MdFQ==
X-Gm-Message-State: AFq9FYJeqTUXsqUEBWSBgZ6/+yuIOQAnWt4SdetlhIC3uST33uJQz1VI
	h5y0aQBiFScnhjEOHZqbtZh4zRc9cw3biIhuXxRQMEHGCSec8YLuLBQk
X-Gm-Gg: AYBFou2NX6bosAe8yumxMNRiyvcZ+dL9Rt+PNI6hc9knYi2P9lKWvgj35c5dVoKVRgM
	nPtUCnjX03+neueji2TGFAX1hmM+Utt4tfzi+Vt/frkEVHxhL/wJc9fl8dIJ9EfAwNKdo478KdV
	1Ifwwm6EmT1Us3TPhKT339DFdzueACvUeuk/sySqM0e8hGXNvAAQxwTbzt1rbabY/CH/ruD88sP
	UZoKbVoMm/J/qhggQY37utT0924VUmhG7TBhRKfd/VmquCicoT+Wm4et7hntwt9ehfHZMiu/fzY
	/26icCnOwGWjWYog3SM/ovwWCezKJje7V0UEL4yu/4f5puKHZI+EBBuABthoi9sDiNbEa0nEAY4
	mZcztS28SKSh+PWdcnlnYvyH26sptGwtwjjBsGvtT8jOo52uzav3nJkuyRMx52h0iE0GUM5S7T/
	1r/nHGAUnjMWQUk+d9uuQhf+ZCukd5cY8HoCVh9kgIke4LVbNjNAMbIr+LadqNpmS1OgWzEys8a
	bG+jiZHPYMPnuGAZwKzRKJp4SclVfYDRVvMvgGyND9qYe4msJpvywKzf9p63M5Zs66Dd7aVzv1E
	6rPv5RF9Ljupa9BA2GFWAPoJVdInRTmEX4Cr2owoWngnCRDOHUqx+aaTMmDFPjkMUs4dIyMnQ/O
	+V2zTMQ==
X-Received: by 2002:ac8:5f0f:0:b0:536:6378:c805 with SMTP id d75a77b69052e-542b7b0a58emr89957211cf.51.1793463874088;
        Sat, 31 Oct 2026 09:24:34 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f47685sm45340756d6.18.2026.10.31.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:33 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
Date: Sat, 31 Oct 2026 11:24:33 -0500
Message-ID: <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

For 1-3:

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
through libcamera. The A16 node is the CRD wiring with ov02c10;
happy to share it.
