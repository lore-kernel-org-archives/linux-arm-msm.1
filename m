Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218916;
	b=5Ek9wXNm5fkz5yfImWNqmkVeqacvjHheZL5kUe6kj5ed6NxoPzmRcMOBJlFkA7XYIBbT
	 jxm60FW0g6c2bqUVfD9whqL2nQS5nJJ4ZdudU8UfrUqHScBJ5GN/H7yhRmjiKD7/s6Dou
	 9s6asr5fdIgY1I5ZvkAvbn7iKZjXyLqV1H6qIIz6e/SKGFXYXBzAUorGfnh+91Yt8ncSa
	 UDmbz0JLJeyAJhW5oGP1ZxsIkruLPOzrCtMX66ilzmFo4bSezytuUedgjS2djDb7+X5Yz
	 vlPSPuVGp+4YIo1Sy0k5FgbhZZNl/JZj83Sb/bTEy47TivRqLidk1bM7dkZAf+qZ5Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CVBcvs4NEZacI32sTy9QLmqQIro1hPd0gzRPGIIodS8=;
	b=Y8mtzG84Ii2O+7oySRseD1tf86sG/qGNguQMXu/Yh7OQH9JmxE2SAqs+2L29f1gpocXs
	 tEIRBYJAXWuPYpd8+m7bZ/jfJEaIXA82R/i5nmGQCwpO4AKND8G5/VcvTrPysKW5WG3Sw
	 wCZdr25n/9FZGO3FLWuUDUvFQBsvp32TD+gwrlIxWVIc4xmUSYtC9fhwPxxFqg4CczWA+
	 GeIVpKSFqELOPtbPWpD22+UB4AvIIwiNpTd+QECx9J8PmRd9gMT1yMwqp3UMWwO1cd0pv
	 zXjOJVh0FIPt6AwyMXlFbFr78eeMq9YeVJcOs6gqCT0xu9TIyhl34QSoSZ2iTuK5+zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lzvQDMQj;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DAC606A699
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DAC606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lzvQDMQj
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-92123f02faeso11786156d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218914; x=1795823714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVBcvs4NEZacI32sTy9QLmqQIro1hPd0gzRPGIIodS8=;
        b=lzvQDMQjTaKlnOvN0osh10u1dCW92+LFSqAhxHVdlifH6CkeHuho3jdMSdRsiLbwaV
         wX08o7Synjp0sr8A48cvdstOBuLGx7U9GHSjHL3E7c6dnT2uw67geq3t0vUjj5LyJ6Tp
         JE1wUyiIep79eGRURxu8A3Rg5rGw+/KEhyd6VM83IQUrbleNhg6k0DH7avYXJE24l41I
         WZP2bDd0+qWRwFbh7w+bs7kPffriV3a3vuLlqTNxf3gzTDm73zoYzZZa0AbHfFwFhhqm
         srZB2N2OPmbT0nC1jIeahzHzGPKfvnnmy1rgv5Ux0Xay4mo7TF3Q1RoanWoX84SMSypW
         YwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218914; x=1795823714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVBcvs4NEZacI32sTy9QLmqQIro1hPd0gzRPGIIodS8=;
        b=0/2HcWtPih00MohT5Uf3RLj8/47KN/9y0JNSV6KTxXdQbrKug1f4gxlj906nN2e+FM
         LAMVNNgal03jnmwt9ZIkMFfLENxBnhoZliz7ibqQROJcmuya3VMI+dMBbfceOjuRSnfH
         ywn91DCQtFG+OnUdXbyN6BEh1/hFpXspa8mJFbJF98A6CH6WV67M+SZFTQbBHIdf6yif
         OeqHTc3FCt2urUxtbI9ihpjNcVaOP8tg9q31f5wMtM8tlqvZpePCvAj0ZXI1Sh6IJm05
         VXtsCfPZEsUnUfbCnuoZE7dn/yZFmr+ZDuPkQwWgpDd6uQHVcFIev72HK4PTOlfkvzf3
         0p9g==
X-Forwarded-Encrypted: i=1; AL+hErENkEnLRm2EWDGGA7mw0u4yP5c7MfVRcB+Bcz+Kl1WCDWdpddzuCy8jzk4rFiTFejJdGvCr/4XajV7iNKws@vger.kernel.org
X-Gm-Message-State: APuU4Z87dlrynovJPDnu0q3xp7EXfkIHccOOgGO4fOuOqTaCjvFxbKxO
	EONJK9hb6ob0CpZDhVc07DSxTED+jL7zap0gIy8RLG1Na4a/Zs+NCTdWhGnAXa9hfPkyrQ==
X-Gm-Gg: AZFdTZcZ52NeKqjs7axtxQSU+mp3ftNdObwo8feqDsliE+hJce+TsrDbs8GJtDLkxkH
	3hnNZygI+kQko8GIfIKEOkEvqLNsA7VSaDqIm6xs75ei7/IiYELrrKzppJto5Yt5q0Gxei6lQ+G
	q/JjzZsOuxuEfkr/DcvaeaClsmbPop4jNHwLhrGza29QQ1uzVGr6RFylAUeSz7F3zRIXBiwecxZ
	4nmKMQnwii5InH4ioXNfB5Z10eR5K8fREc8cWLuIhqovlQ/ftdUcGjHj7Xexd3siqHDg9kwFkr+
	Aj9OgJFo8ye3LWNsp7L2ehWk7vXiQhmwN9eNsaVuLi2tgmd7iYBwBvEGQwEcTzUr0MuOk2LCFwP
	QacVELVJZkntfmee3BZwUALrUOOSs+PJtxRSEEAEDbd00tilwnD54fLaQcmLTMSuevAJeadWWry
	SiOhmG1G6Eu7jovAAgPxIfpHV0HOdGQe4zPKFdlHNSwMn8WWNnQ/ay57h6bvQLl7/fH96zKMaWI
	DDkgaolSUAZ9K4PD5wKG8M+2MNo4XSnYXeZNa6IB05sHmE5HJNHhucwkIM0A49K1YyyAMCM7+xy
	a3HG06WjTbFwt0e+xsK+E3l95WoN3G7wTO1xi9I8rEJZeTvYa8PLFgqRs0JE9LTnWfWW/Zd4PeW
	PX2JCARhI2z3XSNMkmQs4jBkM1DqOsCnQ71aTvbcdBtVCM7zOhftW78IPa4uHvtinpGnTJcVtFV
	Z4w/pDJWK3nT0IdVmeyWReHWcW2EQunn3B/gcwTDw40oiDpqDaYwovAg4CMtSKvqRg1dnhsK+rM
	6CjpLk0UF99KyfGRSKtz/2SVhTdh8NqUAOQDhrSPdu2YA==
X-Received: by 2002:a05:6214:528a:b0:91e:c00c:b7b with SMTP id 6a1803df08f44-92134b28841mr78465516d6.48.1795218914174;
        Fri, 20 Nov 2026 15:55:14 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm39973856d6.32.2026.11.20.15.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 15:55:13 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] media: qcom: camss: Fix the X1E80100 lite CSID paths
Date: Fri, 20 Nov 2026 18:55:12 -0500
Message-ID: <20261120235512.1230-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5485aa11-386e-4648-b27f-f4090bf90d66@oss.qualcomm.com>
References: <cover.1795196107.git.jesse.casco@gmail.com> <5485aa11-386e-4648-b27f-f4090bf90d66@oss.qualcomm.com>
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

On 11/20/2026 10:01 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Just to note that my opinion is that CSID2 shall be removed from the
> resources since can not be used as of today. But others may share
> different opinion.

Hi Gjorgji,

Agreed, I'll drop CSID2 in v2. That also makes CSID n -> VFE n hold
again on X1E80100.

Jesse
