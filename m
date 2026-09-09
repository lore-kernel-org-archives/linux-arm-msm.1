Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84FA35C1AE
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974687; cv=none; b=gU0gIlJP20Bc0A7aVeBqjoOV0rRJzgr/5MlMJPObydHZUA1eWQFyjGmQvyrfOXQopD8VuVwb+G/HiRmqHjiieY0y0oY+bFB1YItky9Oq8sHxpgeBfekzZGoo29K18mifUeIgAZp6iTKRS5Xiy4HW/GVBDXDK+6Dx2yENZ2YbOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974687; c=relaxed/simple;
	bh=qiuNFtPb98vApClnnULP391sos7PBqMq9JUM+pb/ZP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cODgbon7gicmGTsA+53/1a5pq12ObTL8mcuQg2dUG7BOWkp/5KcA/WZPURlu2hGIRJuLE2gWn+uj68BES0Z67hQShSBQtImuMYlGdqpitUn6hquFy1TJc2HV2l/fTgCtBfW6vwYoz+oYAkCcnjJBllJZBIUV0PckEk1Sl3Kst1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7XQa5br; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7XQa5br"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso865001f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974683; x=1789579483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stbPp1ceHQZuJlggdwVYd7G7L2eRqpT5oTNWM81y/zo=;
        b=d7XQa5brybrSRRE9jrock7WmaTMsJfCPSKKIZIg8RQzQwqubJF0JcGYwsrCqE1psTx
         5dXTupBPfZuwJFoo7qBsPjEIm4nPCf/gA7wydJ8hfz1ZhsA4WFv4r9DJnwlvk71QKxT0
         57d5b9Abw9WAxPvlOb4yOHUfQtNy/2HIjC0t+FIwlD74iisFXvSgXdFldNbbe4i+leDo
         a0xCdZhclL/r4INSsQQwso8qAC7jagR9oRaAX1XPuxBKbIF0WW3xTMbteYgvkNwpHlIj
         Mn+rqlw11zRa+PVO4yQQRVmI/RxETJ23qnS29YJPy2hw79RgQO2fQqwrhW+HAAKDMMBa
         gwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974683; x=1789579483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stbPp1ceHQZuJlggdwVYd7G7L2eRqpT5oTNWM81y/zo=;
        b=GDzUrVibyB/h3Zejby3ss/TT0+el65oVZeo9JJ8VpjXK0JCseeWam0NKRgPyOuObr5
         5Zejho1Mu6Ol3ydoy3JSzRuCyK3eyrmo+C/Jpv5Bx4Ni8SoyXCG5xrA8anjrtkQYHvj2
         d5nzNkioHiGnAbEmG7+1AKz296u+7aql3pBE/O/H1ediPuGD4OlRbyO/djSUFw1v3LcY
         c+Z/0+9xSyJsn5fvcSqYyweTbAnS47C7Aq8XzGFL2NiVYOn26R431YHgQMtd2C7H+KJu
         z1gyMgJiUURnFWQkanNiRrKVuiNxwaGTYGOqCEUVvfDebZokHckoQAYnEd0Z3XmDmi33
         zNCg==
X-Forwarded-Encrypted: i=1; AKwUvBxL9Le+OA0s08xCSjbj+/ud6IhPRg6qH3OPhj7Naa45PIg5InuEdXK5U/nzDqxfQ6CiMslVmU/tIpZBZ6UT@vger.kernel.org
X-Gm-Message-State: AFuF++mydb/hdWLnqeGSPQm2REcZOpiuWXERxviswqhSqPrwahcW2gb3
	m0M+qgE5MimiZtoOEn+MmVD6gU66m0XzPO8U+EImFv8ZzkthfQZAnx5K
X-Gm-Gg: AYBFou0cxIPUguk0MYu83+Z/oQ2vWd0aTmXhKaAPle9EtvJGu/QdSW2oOsXFpZPSREa
	IFH9bnyQHtXgEfjpUXy5jn9adpqm+G0bXeW5KNnj3WIMIvdYR4x7uJ1KrKDTENhsPfPptqiDQHs
	6w5zs5V2dq34pGi1X9iouWqI3oryZ5Zv8SEIagiHUI23sfOoiuYQTNUiZpRjuKcL1IWD5q7ifEb
	SJ+CSkLjKvWiRsnW8vtB+paRq/2VTSQ74AoaKnWSztobhr/ll6POMEAtP8e/s3uieEol+V2o11p
	Iz5UiATfyXS/RzzJKWRw5/h7luayHBmynZkuu13l58Veqo35x+pULIGUsq+95slZxgUZjVfMSQc
	9KGmzB9BXMtMDzC5GAfu/TIP8J3XdM2VnXit27GIov8ptjBx8xZvXXi8sK4dLIG3fNvbwPmZw4w
	GyrxoPnKnNukdxnnamgRFEOP4JVhxZ0PyaGUnpIdVg/oCJSfBpFuKLa7Kx7OBdOdIezRo0ajzGM
	fh7BDs63nozbPt8opWOnq91gixTXTvdvH2lcMQNd/cZe7KHhgwSKZu+xNZkOk8BkRAI
X-Received: by 2002:a05:6000:38f:b0:482:f0ee:1390 with SMTP id ffacd0b85a97d-485aaddef92mr16646815f8f.22.1788974682633;
        Wed, 09 Sep 2026 10:24:42 -0700 (PDT)
Received: from archlinux.ht.home (89-74-4-99.dynamic.play.pl. [89.74.4.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm30311792f8f.0.2026.09.09.10.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:24:42 -0700 (PDT)
From: Jan Paszkowski <jan.m.paszkowski@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: marijn.suijten@somainline.org,
	Jan Paszkowski <jan.m.paszkowski@gmail.com>
Subject: [PATCH 0/1] arm64: dts: qcom: sm8350-sagami: UFS
Date: Wed,  9 Sep 2026 19:13:11 +0200
Message-ID: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is about turning on the UFS for the sony xperia sagami
platform.

The patch is small, but due to the grave risk of the patch combined with
my inexperience I wanted to write this cover letter.

While digging through the reasons for the UFS bug in sony devices, I
stumbled upon a downstream workaround in the initial commit for
sm8250-sony-xperia devices [1]. The workaround did not mention the
sagami platform. Looking through android patches for UFS for the sony
sagami copyleft kernel, they seemed to be minor compared to previous
generations[2].

With that I got a spare pdx215 to try this on. I compiled a kernel with
postmarketOS tools. Normal flashing of pmOS on a single partition seemed
to not work, though the UFS device was visible when booting on the sd
card. That said both split flashing of pmOS onto two partitions and
formating partitions worked, at least for super and userdata with ext4.
The booted device detected the partitions and even worked without the sd
card. With that I wanted to send it to the mailing lists in case the bug
is gone this generation.

I guess that most likely I am missing something. If so please respond to
this series. I am happy to test  further to make sure it won't brick
anybody's device.

[1] https://github.com/kholk/kernel/commit/2e7a9ee1c91a016baa0b826a7752ec45663a0561
[2] https://github.com/sonyxperiadev/kernel-copyleft/tree/61.0.A.11.xxx


Jan Paszkowski (1):
  arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS

 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
2.55.0

