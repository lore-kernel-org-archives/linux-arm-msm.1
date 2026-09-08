Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1859B666
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889676; cv=none; b=P0IazGFYWnaR0EU2GH1GTelkFIcOozop9OI6TlFElj1Fu6r97sRyRGH44IbK7l5e0UNx1YvQH6BhNLABy+0Z3jBEsxlcbfUgv3tWa7I1Bgiafejeun/OvWo3Hmd/lfbekYwTdQ9a1VhT9naZ/ZoQbYAG0Mq+kg6N2GOVqI3uTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889676; c=relaxed/simple;
	bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m0V7Lt2/GnkcvUo/gYjkPBBF8lQA49lA2KvwkHJ0MlH2Ap+BSUs+CUhf4aEhq5vd8SzpgKcam9LLF176EJoO3VTTzyrh2SvbBHoGBUsaa1gAh6logZtaQOnPEvUNppPNJh8rmuYca//YEpSRicu/qu0YL6tNJbIKyLG4Ai0wsqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N01awWuc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RkSmjT7X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N01awWuc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RkSmjT7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
	b=N01awWuct1Q/NpyuCxN1KbPFeKAwwUMYIMyXF6YMQaMq8BZZ5F8+SGasmffaFbZXKBCYQC
	ZBrddybfihiNNfBb7fRvqpL5NfbX6r1FLfE3OtNK4TDSdODozZNjGBJcaBsiezxXr8HoAv
	xA5vE3+RCX5R6hR8P6hJeDn/t8tRA3w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-p8wqRdqdN5im5UQpjSl5Cw-1; Tue, 08 Sep 2026 13:47:51 -0400
X-MC-Unique: p8wqRdqdN5im5UQpjSl5Cw-1
X-Mimecast-MFC-AGG-ID: p8wqRdqdN5im5UQpjSl5Cw_1788889671
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so394575885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 10:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889671; x=1789494471; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
        b=RkSmjT7XLMcFZCF4VH/wLJuKXQBuMzUfUjNBo2gWsPrYCdx1u8qly93IafwQaZPirY
         BOIyXrrFYYocsAOTbU0I8Kzt2uqXoFbZJei29/Xky1wGeHWwbwZI69QLxHQf0IPLJOPJ
         bcDcWmXYkJ/n0DgPM41O2X09pp+KglKm4pUCn6pp65vXabrwar52KY+R/21A7EgyxsJP
         EiGkxlkut4UjXbdO4HDL8YuQS9HnptzBYXEiRcxttZ87wj64KmrycGLFbe7IXlHWkUO7
         B0FPXkCh5MIbCH4pP6Bd9iBeg254nJp837cWlquUCualQhAjClufJlkul9UXvec0TdUZ
         2xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889671; x=1789494471;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
        b=foR8wDTrw6W42cdJkP6MaIbG8iIwpf5y3YOjvxvwcA9v3GHqzN+uHYYNe9ijVyzyLe
         3gZT1yRePN9Kzm6m7dTM7mFT/PIVaA6EWyOwhEAmltaV6FXDc7ogoWd21qQ5rsnxhiVa
         iAXOlji5dpQNE4AMua8bTY7+RQY1JJWwr2QE4r3sjApBF3O0a6zbzb732YmPi2u+MgXz
         OGpWQHdKN42vV3ATd+RPHJ9Vyh0fguKClfLXQk4kVx/6Nzr27GOwyZJP5j/uL87zKK1P
         hoqcBy7RCm49utabnuCnbl3Y4rUGFVHH2srsRcoiYLl0xkvP/nVd8tQwzE3ho9yD75D7
         dplw==
X-Forwarded-Encrypted: i=1; AKwUvBykKAZYuEo1uBQ/DC6jtnZ7k+/aSB6pI75UHTC2VVtNHCXsMGmI69cqdu3tEj/4XwyhT834a11MHDL1R6sy@vger.kernel.org
X-Gm-Message-State: AFuF++k7bE/bKjnzAJxqVXRON01L3E426qWwd/ij7eC29uUw/lEVllvp
	odK//QkSBKTjPJHjMzHvGEHLiAl7/92Sbl+SBe0xDDkwbg+b7dBqmUlysyw0YOKPSSrtIbBrDeZ
	wCfpPP0vTVWJWbgQo/w6PH0HKfqkADutdYTuWMXRagY8MoSUqQSNEgXg+u8fLF7Tbfy4=
X-Gm-Gg: AYBFou0FJZl2QpnZpYwRRedHcXHDxuu/Kvks07rqMhEGCqj4rLIy0WDvszXstECReQj
	KFBnZl3DfxGghhA3ZOdjFmlhMNL5brMELcM9Ho9CR/6DQe74/ejDKYwTDgVBbdBvb3ouwXG8GvJ
	bt6fd379vLOVE22KaBGgdIlygOMEtxB8968NanIMcpjHYT9fy5poKa4+8czxgXMl5E5wHMj3oDe
	fVVymnqLlNmjmCNp71f7Wc1ITF40Pf7WWJScBSNTbVbpE7IeVdw1v2hXa3bZQegnVAVrx4g9JS7
	ZDkvklL7HfqUGuiKNoXoUqfgaQfrt/5ZnKBaK8LBhO3e2Z8w4ljeChV2f0owmm7Jo/C9uOhsXAQ
	7vSlOfc7aIj8kryzRLhpycYUp6NnhyNdF+DV/8Sg=
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317501485a.32.1788889670668;
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317454985a.32.1788889665304;
        Tue, 08 Sep 2026 10:47:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce
 boilerplate code in drivers
Date: Tue, 08 Sep 2026 13:47:17 -0400
Message-Id: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwML3eLSpOLK4vjMvMyS5MScHF0D05S0FNO0JIM0AxMloK6CotS0zAq
 widGxED5QS1ZqcgnIGKXaWgApYv2WcwAAAA==
X-Change-ID: 20260908-subsys_initcall-05dfd5fb0f04
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeJmuupF5qfh/577Yn+n6AlwhRTy8z9+nMK7UN53dY
 njB8hdTRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5y8DwV+bCmc9hUzsWllQ3
 T0866pnk3+b3w9Wt4l5L02+uoEu3rjAyzC//cKIqLmHOvw/rd5y/xuD2JExGfTFbQpY2n87nG8c
 fcwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are a fair number of clk drivers that are registered at the
subsys_initcall level since some clk drivers need to be initialized
early for other drivers. Let's add a new macro
subsys_platform_driver() similar module_platform_driver() to eliminate
some boilerplate code in the drivers.

This series converts the Qualcomm and Renesas clk drivers to show the
code savings that can be achieved. Once this lands, I'll convert the
remaining clk drivers this development cycle if all of this can go
through the clk tree.

Outside of drivers/clk, there are 364 drivers that use subsys_initcall
and I am willing to convert those as well starting the next development
cycle once this lands in Linus's tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      driver: core: add subsys_driver() macro
      driver: core: platform: add subsys_platform_driver() macro
      clk: qcom: convert drivers over to use subsys_platform_driver()
      clk: renesas: convert drivers over to use subsys_platform_driver()

 drivers/clk/qcom/dispcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/gcc-eliza.c           | 12 +-----------
 drivers/clk/qcom/gcc-glymur.c          | 12 +-----------
 drivers/clk/qcom/gcc-hawi.c            | 12 +-----------
 drivers/clk/qcom/gcc-kaanapali.c       | 12 +-----------
 drivers/clk/qcom/gcc-kuno.c            | 12 +-----------
 drivers/clk/qcom/gcc-milos.c           | 12 +-----------
 drivers/clk/qcom/gcc-nord.c            | 12 +-----------
 drivers/clk/qcom/gcc-qcm2290.c         | 12 +-----------
 drivers/clk/qcom/gcc-qcs615.c          | 12 +-----------
 drivers/clk/qcom/gcc-qcs8300.c         | 12 +-----------
 drivers/clk/qcom/gcc-qdu1000.c         | 12 +-----------
 drivers/clk/qcom/gcc-sar2130p.c        | 12 +-----------
 drivers/clk/qcom/gcc-sc7280.c          | 12 +-----------
 drivers/clk/qcom/gcc-sc8280xp.c        | 12 +-----------
 drivers/clk/qcom/gcc-sdx55.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx65.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx75.c           | 12 +-----------
 drivers/clk/qcom/gcc-shikra.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm4450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6115.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6125.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6375.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm7150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8250.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8350.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8550.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8650.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8750.c          | 12 +-----------
 drivers/clk/qcom/gcc-x1e80100.c        | 12 +-----------
 drivers/clk/qcom/lpasscc-sc7280.c      | 12 +-----------
 drivers/clk/qcom/lpasscc-sdm845.c      | 12 +-----------
 drivers/clk/qcom/tcsrcc-eliza.c        | 12 +-----------
 drivers/clk/qcom/tcsrcc-glymur.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-kaanapali.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8550.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8650.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8750.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/videocc-sm8750.c      | 12 +-----------
 drivers/clk/renesas/r9a06g032-clocks.c |  8 +-------
 drivers/clk/renesas/renesas-cpg-mssr.c |  7 +------
 drivers/clk/renesas/rzg2l-cpg.c        |  7 +------
 drivers/clk/renesas/rzv2h-cpg.c        |  7 +------
 include/linux/device/driver.h          | 31 +++++++++++++++++++++++++++++++
 include/linux/platform_device.h        | 30 ++++++++++++++++++++++++++++++
 48 files changed, 107 insertions(+), 487 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260908-subsys_initcall-05dfd5fb0f04

Best regards,
--  
Brian Masney <bmasney@redhat.com>

