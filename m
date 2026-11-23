Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476529;
	b=sNk8LVdQ/RtB28FhGSbHr58nmkwOQv2BGvonfvWOLk1CjwjwXcdepeJw1wGjN0xyPZCn
	 8C0tL5iIY9grruUr7BVPZFmpQlvRbtJRwhGt8DsKfz/osevHE5QnkO6tJ+hA02Uo++Pbi
	 Iss5Ty4qKGuEcIY3mBMKhkVNrsHA60MFtMf17VUJHGHoG9i/NmiXHDDzVutO9qHUkoRLW
	 j4mlRE4ChuMA2vLnvfqL1/v2n7PRrySY4QhjQc9NTjEEp2AJtWI2LXsk5HvGIBFYGLVvE
	 AJQo72WQIQ1a7qb8z9Pla1levn+drXjVS/r2CiHhI3qG14uKPsKFsafx3ujvD04M+bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FwJrm1ZM1aehEhc2izkgjrLKRPEQAGiya3xImxW3kxg=;
	b=irIdICJKE2478QxiN7qQ4UqKxNj8zl5YzAml1dH8HfavuXsgvq0I/LDj/aHDFr1D7GuM
	 R0AXdJ+uPiZ58zHJZTnwGf9q8gri+PfqovOzR+0NsZ+NATZj61Otl80ROrS8tnr4u41sE
	 4cUYGjGkoDXqulIjQ6Ou1rY3n69g/8USw3mf+vQOsoyrHgrg/JGZE5vb5TyXu9eMob34k
	 Istu7tHVOX2ZASrfTLGWzU0z0ZMRbvo9HtjMHfm6bgjA3dPskHJjbGeHqQkqjVlr+Q7jF
	 fTjhDAb8MNchqp1auiN0/YcdW7FmZeTxP5TDYqtdZzavpKMexr2i8e1uvPWqPqDJZmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nAJlelzV;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691DB606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 23:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nAJlelzV
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so726160966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476528; x=1796081328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FwJrm1ZM1aehEhc2izkgjrLKRPEQAGiya3xImxW3kxg=;
        b=nAJlelzV0W3bFHx1nGZMeGZf3y/OlXVcMa/J8vDvS2w6VWGcot66X8UINPIPB8tBuQ
         GmQjfzIWAwjz8+VDCIPqbsgcos9UcuSo7As81vg5OTC2Xxbhemto71gX3I13isNm6KVw
         ueG/2Geai9otTFoOviDwOK+kaj6BliZMYsp7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476528; x=1796081328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwJrm1ZM1aehEhc2izkgjrLKRPEQAGiya3xImxW3kxg=;
        b=E7kGKE7zho/mRnY5JU941qiSs4dD5beHOUCebrGmZtr0wzxQYzlBlb/qvoBW9C2FJh
         /aQlqGf1m2mmn2FHBUYTb9koNDicrhcaoTu6GWWfcnqEp5QMnL11iRg/bywCFht5PFyZ
         sVtwJ0bV5+r8+AzJn959+U2841ym8grHzUzGBudVTLixSncNSuuP7gtG2njslUGIOn8w
         D5sRw5CPCzMasWKjdyOrmNYv6Q/L0ZzUfCFdZP76pk9+AUU+EOL8TQP0NTYRKij+FLtc
         cBnZdZkwXb3tRXshGdy/i/lEVcqUwfr0NM9qw4rGflIHLNxLP6B8apj3kyDbT1DKwuzD
         1B9g==
X-Forwarded-Encrypted: i=1; AL+hErFqZhLBLqDugbG0rwww9hdAluBZ+qfE97kYWaavbnwq/xf/pBSkGNytxANt05mj3OrBCqsvquUIi1092ZoB@vger.kernel.org
X-Gm-Message-State: APuU4Z9jvefDPDGIcC8fmcv9y9h2cKnjSD5Bvq3zqo1w+A58sMyvnK1G
	z2r2ulpiJ9jJCX90MR8/oEg+o86YAMSHk2qAUI8KNWDwjk2xZMeRhDmAmZ+p4JQ627IqNrUGSuQ
	pKqjNyQS8
X-Gm-Gg: AZFdTZdpBYUZUmpVvkiW2BCClwL1mYng5uWmPvZBmts0X/UFRRa3GAgHonwbw4VPCXn
	mnqvBBL7qgzGFoznJxaWj7SS++1j7QNNaniDeMoYvotMPZNBFlFSvp3hqKas3JgtY9PvWY/KxlB
	lok6aERk6fK2g30qebLJ55SFK1O95zh/QqwmfLZE/CDIsKPStxQwRmMdSmn7BAYeBEKMlVFqxos
	7zIJqE20bJGF1cu7mfvAQXYpdRa7KNqZ2qKByCyZptJE/JkguM3TGehyl3OOzW2sAY83VReNe0a
	eUyg0OsBIMJq8MCXD/rJBl2jtAIDo0pi6JA+9ItWJBI4GV9qagX/mw9JFu2NwNP0PWYO3XnLJYV
	hsHw58hl1n4/6sowRxNIpdntH10Se00Yir+7q10FKh1/c8wpL3KbsUxTY/539We0KdjzgwYw9BD
	YXBUZPSTK7t+ei7inwpfO/KUCWDS0mke7yjztkPCrBi2iyent0uMCR9NSuyxlkZHQrnZCrCtypb
	qXOaxmZixz6gQx6A7c85rD0jsZPHFC/zL10COkmZ2EGAj3BR2/uTtIV/suBO1VbzBJGERu3OaBq
	10y5OjRyPfv9L0Agr1pHpoSGaQE74eKvb0tmsZhd6B2u8IVH3LwaRWSQZ6yOWINOW0XWWQ==
X-Received: by 2002:a17:906:1103:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c513a52dc83mr751536966b.6.1795476527866;
        Mon, 23 Nov 2026 15:28:47 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm440862466b.65.2026.11.23.15.28.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:45 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so3210811f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFDoxfPFSqlUkGDqGPVUlC47iIIiPHB2hzchLcPXbEUOGbZylScpszJUY6OyMTZk76bWlM6FQa6TQjPI71A@vger.kernel.org
X-Received: by 2002:a05:6000:26ca:b0:4a7:8406:1e6f with SMTP id
 ffacd0b85a97d-4abb0c5d691mr23431674f8f.17.1795476524227; Mon, 23 Nov 2026
 15:28:44 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-4-mrungta@google.com>
In-Reply-To: <20261112031629.396819-4-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WosKh8Rxh1J1cJDaWOEfS-pYneBmjd8FzOV3oyv0HgdQ@mail.gmail.com>
X-Gm-Features: Aa3M54rF-cDwPhWxLgyNjBG3mfbaET9nDbSRqTDaBh2OJu2DLtMaENnnVT7qQnE
Message-ID: <CAD=FV=WosKh8Rxh1J1cJDaWOEfS-pYneBmjd8FzOV3oyv0HgdQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] genirq: Implement synchronous disable_nmi()
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A . Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:16=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> Currently, disable_nmi_nosync() is the only interface to disable an NMI
> line. Drivers stopping their devices need a synchronous variant that
> guarantees any running instance of the NMI handler has completed on other
> CPUs before returning.
>
> Implement disable_nmi() by validating the descriptor, disabling the line
> via __disable_irq_nosync(), and synchronizing in-flight NMI handlers via
> __synchronize_nmi().
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  include/linux/interrupt.h |  1 +
>  kernel/irq/manage.c       | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
