Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163484DDB3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841736; cv=none; b=O4EZTs/taCIYvJ1ItSDEfGFydrZkJE2Q2RKWP5owW/zPuznqPMEFmF3bTYokeVoi4Fwo+QO2bcfy502zitqIyBv/6I49hRgLC0WTU7NjNa0ZL43uBGX8E7CBVm2jkJWoylL0+GOO4kVRkcIGBVJPMV+zjIyVnuaNE/pb3PvgYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841736; c=relaxed/simple;
	bh=+LM//r49lcXL5ulzjzgjIm9/ZR3GBPhGYI9a3F9PvLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecj7PVZn3aXBNDNHCYs7RrD4sHteQe0lFPggwV57H/MqlNqlaOY3ncvVZKl3U/yklj4ych37hO28YU1e9eXZGGN3B0hqoV8bFKU9VXUA8nguplq1IZWuRY2QxpzNVio+8qoBeBP2k4HqZp2859bwt1P0pvot0z1/jmLrYNZJmNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPHTD69Q; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPHTD69Q"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8d2574fd9so9699345ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841734; x=1792446534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=WPHTD69Q4BSSs8GKF56nQ28NGwtzMmd/jsMN/EEo2BkL+mXjWRO5XpDSu0u/bK7+xN
         N8CQ17XNUvtuM2ak7SG6AW0rJ7i2VqNmVNZ9GxDXB1JQERzjImWU0mkElVYTiPCFL7nJ
         jtzRTtwnN5OqzML+aeq7lRq4QuyKv8qcisJuyVFT9gM58js1ZO2UgfBDsm9rIYUZWemR
         IZgGJMDiKdEyWdCaRqeih5GCeNVtzzxPbKpKB32vm+90KjPm/VLx/kF22DFdsyjP2Bcy
         bTdQTRkE5Q0iG8VNsv7Zf8c0RI8DFmbipdQikEdPR4Imj82b9rT4Ao+jeXybS1l/POXl
         DQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841734; x=1792446534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=vtelhLu3wopZhRTuRbVDONoK9/RmnEkUsLjHeg1EdbSRPZc/Nug3TYPZ7bWmue7jf1
         hYBldFCj8l37uKgl8nnGtjaVVi4ieSKFlpzb9Lir/5tbO3k2EqaAmBj20/Kz9WAtFTWH
         D5EocoY8V40BqreVpgPRCWQ3UD/exmV+RfLe68ncVctwxIpHeYlzUAR7p/+3wbpdrIwO
         9vmFx+gxOjYCtNr+TJcRT08GtGm/ySi9Ry3594oAbdpuV0htTeDQ79c0RqU1RhQzAx+L
         wL/7iqaBiBVb4zsXJ7nn+2bW+mYJVJknkE76Xh9WyAGPmnKKqYy7tNj2CQWXtt+6u/HV
         XhCA==
X-Forwarded-Encrypted: i=1; AKwUvBxr5wSNPMVa73FNFmLSrKShzaZ9zOtjjlmf47FPCcBJZOlzmpJ1P1W0baqVjmP4VpdjYN6xZ9wQ5Rz9O0eE@vger.kernel.org
X-Gm-Message-State: AFq9FYJmIt2iGgUMmbf4hg5H7zrl7KWpbH5xI4aD2owaRcZ+kIvpIZ3K
	A3tEp3LBLlk5kLT8EhZYYIjbkqYhLhR/90dNBXwEvwHz/QWRqrafBnxa
X-Gm-Gg: AYBFou2vP7SPzmD4SXXBC32IeE1I4ute5/AnDa65hey6fM8iaa0mQ3d+bPzQ1t3M9qA
	eSAwZCX1Lov0PCyPFBeWj7lVzfB9QDAPvsWtMCtYSSsxLJDz7r0wd+s1YvsBQul9SvOjRdnHlJw
	BnWtIy6BJ70/D9MyoBaa4xQ5VH+dDBKMygEKBUmwpJfM/9j67f2j6rhatBQV2dvd+nITc9cXo7Q
	V8uKNAgspt1NcHESlSc8trmmVKeJGXNAzmap4Uk13kk8zaVcgCYY165oODLGOp8PTcAQDlyd7he
	Ts8MwRnLIyBdOzUMAlOoXK9aEoXhGqSqzpM7WCvF9zvkufRW5yqyUShhhh4kYXA9caMAatPxOT5
	BWdcQWxtghpby0MXd0AGAx8/L9JfjNK0rFHffWuA91J0JIvZYwRWNmyeMLmqLXpQrTFBWLQSsTi
	HhXerOUuFUxvDqD/jnOHrlaOXg9m3Bm+bzO82A7l2NnjORp88cO6sNAClrW97WI3v4d/xmzUHvq
	5y6i6ecKTtNH26xsgGAeZwIVZ1sjhewmDmc915KSWSfW8IlwMyhlhdPCKmMHw==
X-Received: by 2002:a17:902:ffd0:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2e842aa662amr86633865ad.19.1791841734180;
        Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1c89sm45467445ad.75.2026.10.12.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:48:53 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Tue, 13 Oct 2026 08:48:33 +1100
Message-ID: <20261012214834.357754-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A14 (UX3407RA, X1E80100), which this series does
not enable. Applied onto next-20261001 together with local nodes for this
machine's OV02C10 on CCI1's second I2C bus and CSIPHY4, written to the
pattern of patches 07 and 08.

The media graph links end to end, with every hop enabled:

  ov02c10 11-0036 -> msm_csiphy4 -> msm_csid0 -> msm_vfe0_rdi0 -> msm_vfe0_video0

carrying SGRBG10_1X10/1928x1092. libcamera captures continuously at 28-32
fps through the software ISP, and the frames are correctly exposed images
rather than blank ones: a captured 1920x1092 ABGR8888 frame samples to a
mean colour value of 118.8 with 99.8% non-zero and 203 of 256 levels
represented. No CAMSS or CSI-2 errors appear in the log.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
