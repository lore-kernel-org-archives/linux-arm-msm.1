Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307283;
	b=Vi7MgD+Zj2qB0WxWpUqW3Jo72QAISt7btVrd4qoVLAf6y2/P0GILc0sUoaCH84qYgCGG
	 7RNr7jBRLUU/qzU2TJ37Wsf6M26NGuvssqvJSs8Mt+zXiZij9Q3VKKr3amFH2KXJiYsWF
	 n+0MpoR/w7KU7IyoSQl08DE//jx+BoCwEXEkL7/hlchdzwLvvdtHThExnsi1o2j5q6UOd
	 9GEKegAaHe5uG25DRJx4zNllTFJwo10rIbNs5QLkkYLqQnXGe2kLjdwo4EFmHpab/bf2D
	 QzskdIENBS72v+sQSkC0jSscuR/tLb4MTZMbVUHGys/0IpCnuMZklOoeFFEgmCYn8eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/p4Vh0SUWnhUeQ71TXUxbzKmIv++dPKIuj8FkNX8BXE=;
	b=h4p7l0pvpUDjpzS43xoaTiUKsntzarawlwcZQ9KRJ+Oh0a3Glt1riTxEfhXA8KuJfSbe
	 hRPCP9w57+a7uFblVJfGeac5COH/ix3yTsp23Uc1tmUcK21x/hhRuvQC+7ym5XFFrMIPz
	 azXMgNJwgertRm3bOtFGIFfmoGqSrn3r0JUoZRpJE/PeC9DxsnZVyevbBqWtgmf+xvqyL
	 dIwsNYopt62PV1WTVoxOepVFcN5oyJ8jrTjnQRmr2XHAXiMMAjNRWypzq8bi8hi3lzCqr
	 IMAyscwzTIAOzkurJLQTwNzo9IaUXJuWB4S+d0Poi8fSOnhNXIQsnIV6Ll354XJMz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nmZ6qwN;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE3606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 00:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44AE3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nmZ6qwN
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9211efaca89so28705356d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307282; x=1795912082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p4Vh0SUWnhUeQ71TXUxbzKmIv++dPKIuj8FkNX8BXE=;
        b=0nmZ6qwNYk+YqlUBP3aq8k7s5WYv6dj4ZETp2mlwZFNpuZpEfQh5iXSl4uwg3cUQX0
         LqAhs0yU3OsFlUZ975jEbYrTbps3UUZtMGeeWX8en4upG63E3NEPmRoS6v9n7QfqcrSv
         u/JxwVQJDShxy6dG7y+BePcckU+hx6vw1gDW/kRLpJAZ9UFW0/1QbODgz5fG6TaBw9Ss
         TNH1rlqKT4eAGkZHkDla9yFW29Qw3t/veqRDv9vjN5MLwvqzAuFkXyeZLJkJjGX8fVrN
         p8082iX0HPTMsreXeyvnK0Vu30GZRjjilkhgs3XXzNxz4N01/xIRyOzPoSgGeIkz5pmH
         kvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307282; x=1795912082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/p4Vh0SUWnhUeQ71TXUxbzKmIv++dPKIuj8FkNX8BXE=;
        b=Qxm0RtRmdnUGshKD7eeG1UFwkrs75Efm6RP/QxjpJuCe30DUmtuRkn6VeCOqOmzOPx
         hzYrBOuH+hxhgU6dhFEeiNQC4rW/OZxtJbVkJW2QKgqvgsshPZKzIj8BkLQnp4AuubiR
         7XYBIUJB+9pZZMPx3friAWA567Lko93x0abtYTuPETgnENQ4MyaPaa45Z8kHjgftFXt6
         X4BKCGeChwVpH4D771RBAMNf040TD8mfUW2BjP/6sSfbEuR+mXFcx+T6pT703YiOgNa8
         JzBdKz1MQgkDZx7BiS5uk52f11jMk36HoSFqAmo/WGV03y/T/nx8AZD8hthrwp8k1V2l
         Y/GA==
X-Forwarded-Encrypted: i=1; AL+hErG12A7ykrE4kR0xw139/KwfNKDq8OL9ncxg/uWbzaM6/pbh/lMwV/sbMtOG3y+GT72ZJ2SSFBz6fd97fg6W@vger.kernel.org
X-Gm-Message-State: APuU4Z/rKiSCyS1Fr9JuKXRr5XpHgDpTMrZHnP3jb8S+/V0X4RthGAM3
	4mCHx7gQvdKkJFnUd0qoNL0S4yTZ6TdPzknAqfZsRnkjMOT7Kagd9aGM
X-Gm-Gg: AZFdTZdFtf3cwBO6VoL02iDoG8kIfmsxfD80aYjKdzy1mV15JredjIP5UbxNWNXKyst
	iKtifZF5rW2V7SqveWaOoMJw/4cxQw8//3Blje322m4bmIpVtv5xlyBNf0ZSr7MHDIB8LsPztt8
	3TjkXUsj01z2zF1BVYdffgVRZfVuBHDgB1rgPwWslT28KemrMYojpZTN5PFwPXFb4KyLCw6iMqc
	kYQHUCZZy3UwJODPC4/ons5AkxmX9kgmuzDttaXa/1AfDvrTyLEqeTPl0f1oaJCJB/5gHgxWz2p
	jAsicyWrwpdoQEyuXiEKg0/yADN6wN1tTqjwzyy7z4SdUF6saiCIvVgBD+c6tHrKzfR5ub+ax6T
	ZqfS0YCmiKz4cVI7PWnrIQsrFdNfPc45oyG4Hnw0uMhyHdXCXQJorHxDDNBwbF7OoyKDiW3ZNmO
	Wj+H5Bmo5XlhjKnapvQx0bzNtczYIiVNgDMfh4ULQpxYimeNf2GYjCzoTh1/DCIJyyGMIUVLHTu
	41IU2X0qAsmRoyTdKayfF9xYtWKcZZLowbwcfbIWmNroymZ0VmPi/FTRCntmPsWYTv8vJ/OmOrG
	zibHllbv8f7kJrEqgitGleGoT7/dmNGCOQXXbnPXqpmYuvuGVjt7UGev6U3CJJZ/kceP2iDP8yQ
	KSsPWmgG9YSdwIZ3CaEEsdlvqdm5WmKpdyv47KfFgeLqKl3zcT7oJDNybCBTAhfFDt7AbBmeNbR
	hLwgbNzN8eJtZXH6XR6TBd6kXqZ+8/LJZ22hphNjy2NBlziEqBOMk+oMgJYUE3vI9A4VPe/9akB
	PVY04PTBubgwcUrgDP9lNXw594g8IBJwTHtExcfkqXd
X-Received: by 2002:a05:6214:5294:b0:921:b6f:e3ca with SMTP id 6a1803df08f44-9213498a6f9mr127926416d6.3.1795307282131;
        Sat, 21 Nov 2026 16:28:02 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:f0ac:1f5e:5039:487])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d2322sm66241886d6.19.2026.11.21.16.28.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 16:28:01 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Sat, 21 Nov 2026 19:28:00 -0500
Message-ID: <20261122002800.41569-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120220025.56887-1-allan@fatecpompeia.edu.br>
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com> <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com> <20261120220025.56887-1-allan@fatecpompeia.edu.br>
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

On Fri, Nov 20, 2026 at 07:00:25PM -0300, Allan Siriani wrote:
> I'll drop it if the parent is resolved from the link as in Jesse's 2/2.

Hi Allan, Gjorgji, and Loic,

Allan, my 2/2 mapped CSIDs to VFEs by index, not from the link, so
MSM8916 CSID1 would still fail. v2 drops CSID2 instead, as Gjorgji
suggested on 0/2, and leaves vfe_parent_dev_ops_get() alone, so please
keep your patch.

Loic, every CSID still links to every lite and full VFE today. I can
add a patch to v2 that skips links between lite and full blocks, but I
can only test Glymur. Are they never connected on any of the non-ISPIF
SoCs?

Jesse
